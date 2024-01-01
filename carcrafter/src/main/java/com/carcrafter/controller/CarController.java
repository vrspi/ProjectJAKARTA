package com.carcrafter.controller;

import java.io.Console;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.nio.file.FileAlreadyExistsException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.carcrafter.ViewModel.AddListing;
import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.*;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@WebServlet("/AddListing")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,  // 1 MB
        maxFileSize = 10 * 1024 * 1024,   // 10 MB
        maxRequestSize = 10 * 1024 * 1024  // 10 MB
)
public class CarController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EntityManager em = JPAUtil.getEntityManager();
        if( request.getAttribute("listingTitle")==null)
        {
            request.setAttribute("listingTitle","");
            request.setAttribute("price","");
            request.setAttribute("mileage","");
            request.setAttribute("engineSize","");
            request.setAttribute("vin","");
            request.setAttribute("tags","");
            request.setAttribute("description","");

            request.setAttribute("selectedcondition","-1");
            request.setAttribute("selectedbodyType","-1");
            request.setAttribute("selectedmakeBrand","-1");
            request.setAttribute("selectedmodel","-1");
            request.setAttribute("selecteddriveType","-1");
            request.setAttribute("selectedyear","-1");
            request.setAttribute("selectedtransmission","-1");
            request.setAttribute("selectedfuelType","-1");
            request.setAttribute("selectedcylinders","-1");
            request.setAttribute("selectedcolor","-1");
            request.setAttribute("selecteddoors","-1");


            request.setAttribute("Name","kadi");
            request.setAttribute("Email","kadi@gmail.com");
            request.setAttribute("Phone","0682653265");

        }



        TypedQuery<ConditionT> queryConditionT = em.createQuery("SELECT c FROM ConditionT c", ConditionT.class);
        List<ConditionT> ConditionTs = queryConditionT.getResultList();

        TypedQuery<BodyType> queryBodyType = em.createQuery("SELECT b FROM BodyType b", BodyType.class);
        List<BodyType> bodyTypes = queryBodyType.getResultList();

        TypedQuery<MakeBrand> queryMakeBrand = em.createQuery("SELECT m FROM MakeBrand m", MakeBrand.class);
        List<MakeBrand> makeBrands = queryMakeBrand.getResultList();

        TypedQuery<Model> queryModel = em.createQuery("SELECT m FROM Model m", Model.class);
        List<Model> models = queryModel.getResultList();

        TypedQuery<Year> queryYear = em.createQuery("SELECT y FROM Year y", Year.class);
        List<Year> years = queryYear.getResultList();

        TypedQuery<DriveType> queryDriveType = em.createQuery("SELECT d FROM DriveType d", DriveType.class);
        List<DriveType> driveTypes = queryDriveType.getResultList();

        TypedQuery<Transmission> queryTransmission = em.createQuery("SELECT t FROM Transmission t", Transmission.class);
        List<Transmission> transmissions = queryTransmission.getResultList();

        TypedQuery<FuelType> queryFuelType = em.createQuery("SELECT f FROM FuelType f", FuelType.class);
        List<FuelType> fuelTypes = queryFuelType.getResultList();

        TypedQuery<Cylinders> queryCylinders = em.createQuery("SELECT c FROM Cylinders c", Cylinders.class);
        List<Cylinders> cylinders = queryCylinders.getResultList();

        TypedQuery<Color> queryColor = em.createQuery("SELECT c FROM Color c", Color.class);
        List<Color> colors = queryColor.getResultList();

        TypedQuery<Doors> queryDoors = em.createQuery("SELECT d FROM Doors d", Doors.class);
        List<Doors> doorsList = queryDoors.getResultList();

        TypedQuery<Features> querFeatures = em.createQuery("SELECT f FROM Features f", Features.class);
        List<Features> featureList = querFeatures.getResultList();

        request.setAttribute("ConditionTs", ConditionTs);
        request.setAttribute("bodyTypes", bodyTypes);
        request.setAttribute("makeBrands", makeBrands);
        request.setAttribute("models", models);
        request.setAttribute("years", years);
        request.setAttribute("driveTypes", driveTypes);
        request.setAttribute("transmissions", transmissions);
        request.setAttribute("fuelTypes", fuelTypes);
        request.setAttribute("cylinders", cylinders);
        request.setAttribute("colors", colors);
        request.setAttribute("doorsList", doorsList);
        request.setAttribute("featureList", featureList);


        em.close();
        request.getRequestDispatcher("AddListing.jsp").forward(request, response);
    }













    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String listingTitle = req.getParameter("listingTitle");
        String condition = req.getParameter("Condition");
        String bodyType = req.getParameter("bodyType");
        String makeBrand = req.getParameter("makeBrand");
        String model = req.getParameter("model");
        String price = req.getParameter("price");
        String year = req.getParameter("year");
        String driveType = req.getParameter("driveType");
        String transmission = req.getParameter("transmission");
        String fuelType = req.getParameter("fuelType");
        String mileage = req.getParameter("mileage");
        String engineSize = req.getParameter("engineSize");
        String cylinders = req.getParameter("cylinders");
        String color = req.getParameter("color");
        String doors = req.getParameter("doors");
        String vin = req.getParameter("vin");
        String tags = req.getParameter("tags");
        String description = req.getParameter("description");
        String agree = req.getParameter("agree");


        String[] selectedFeatures = req.getParameterValues("feature");


        //verifier le tire listingTitle
        Map<String, String> errors = new HashMap<>();
        String pattern = "^[a-zA-Z0-9]{5,20}$";
        if (listingTitle == null || listingTitle.isEmpty() || !listingTitle.matches(pattern)) {
            errors.put("listingTitle", "Le titre de l'annonce doit contenir entre 5 et 20 caractères et ne peut inclure que des lettres et des chiffres.");
        }

        //verifier le prix
        String pricePattern = "^(\\d{1,10})(\\.\\d{1,2})?$";
        if (price == null || price.isEmpty() || !price.matches(pricePattern)) {
            errors.put("price", "Le prix doit être un nombre valide avec jusqu'à 2 chiffres après la virgule");
        }

        //verifier mileage
        String mileagePattern = "^(\\d{1,10})(\\.\\d{1,2})?$";
        if (mileage == null || mileage.isEmpty() || !mileage.matches(mileagePattern)) {
            errors.put("mileage", "Le mileage doit être un nombre valide avec jusqu'à 2 chiffres après la virgule");
        }


        //verifier engineSize
        String engineSizePattern = "^[1-9]\\d{3,}$";
        if (engineSize == null || engineSize.isEmpty() || !engineSize.matches(engineSizePattern)) {
            errors.put("engineSize", "La taille du moteur doit être un nombre entier supérieur à 1000");
        }

        //verifier le vin
        String vinPattern = "^[A-HJ-NPR-Z0-9]{17}$";
        if (vin == null || vin.isEmpty() || !vin.matches(vinPattern)) {
            errors.put("vin", "Le numéro de VIN doit être composé de 17 caractères alphanumériques (sauf I, O, Q)");
        }


        //verifier les tags
        String tagsPattern = "^[a-zA-Z0-9]+(?:,[a-zA-Z0-9]+)*$";
        if (tags == null || tags.isEmpty() || !tags.matches(tagsPattern)) {
            errors.put("tags", "Les tags doivent être séparés par des virgules et ne peuvent contenir que des lettres et des chiffres");
        }


        //verifier la description
        if (description == null || description.isEmpty()) {
            errors.put("description", "La description est requise.");
        }


        //verifier le champs agree
        if (agree == null) {
            errors.put("agree", "Veuillez accepter notre politique");
        }







        EntityManager em = JPAUtil.getEntityManager();


        //verifier le champs condition
        if (condition == null) {
            errors.put("condition", "Choisir condition");
            req.setAttribute("selectedcondition", "-1");
        }
        else
        {
            // Vérifier si la condition existe dans la base de données
            TypedQuery<Long> countQuery = em.createQuery("SELECT COUNT(c) FROM ConditionT c WHERE c.conditionTID = :conditionID", Long.class);
            countQuery.setParameter("conditionID", condition);
            Long countResult = countQuery.getSingleResult();
            if (countResult == 0)
            {
                errors.put("condition", "Condition n'exist Pas.");
                req.setAttribute("selectedcondition", "-1");
            } else
            {
                req.setAttribute("selectedcondition", condition);
            }
        }









        //verifier le champs bodyType
        if (bodyType == null) {
            errors.put("bodyType", "Choisir bodyType");
            req.setAttribute("selectedbodyType", "-1");
        } else {
            // Vérifier si bodyTypeID existe dans la base de données
            TypedQuery<Long> countQuer = em.createQuery("SELECT COUNT(c) FROM BodyType c WHERE c.bodyTypeID = :bodyTypeID", Long.class);
            countQuer.setParameter("bodyTypeID", bodyType);
            Long countResult = countQuer.getSingleResult();
            if (countResult == 0)
            {
                errors.put("bodyType", "bodyType n'exist Pas");
                req.setAttribute("selectedbodyType", "-1");
            } else
            {
                req.setAttribute("selectedbodyType", bodyType);
            }
        }


        // Vérifier le champ makeBrand
        if (makeBrand == null) {
            errors.put("makeBrand", "Choisir makeBrand");
            req.setAttribute("selectedmakeBrand", "-1");
        } else {
            try {
                TypedQuery<Long> countQuery = em.createQuery("SELECT COUNT(c) FROM MakeBrand c WHERE c.makeID = :makeID", Long.class);
                countQuery.setParameter("makeID", makeBrand);
                Long countResult = countQuery.getSingleResult();

                if (countResult == 0) {
                    errors.put("makeBrand", "makeBrand n'existe pas");
                    req.setAttribute("selectedmakeBrand", "-1");
                } else {
                    req.setAttribute("selectedmakeBrand", makeBrand);
                }
            } catch (Exception e) {
                errors.put("makeBrand", "Erreur lors de la vérification de makeBrand");
                req.setAttribute("selectedmakeBrand", "-1");
                e.printStackTrace();
            }
        }




        // Vérifier le champ model
        if (model == null) {
            errors.put("model", "Choisir model");
            req.setAttribute("selectedmodel", "-1");
        } else {
            try {
                // Vérifier si modelID existe dans la base de données
                TypedQuery<Long> countQuery = em.createQuery("SELECT COUNT(c) FROM Model c WHERE c.modelID = :modelID", Long.class);
                countQuery.setParameter("modelID", model);
                Long countResult = countQuery.getSingleResult();

                if (countResult == 0) {
                    errors.put("model", "model n'existe pas");
                    req.setAttribute("selectedmodel", "-1");
                } else {
                    req.setAttribute("selectedmodel", model);
                }
            } catch (Exception e) {
                errors.put("model", "Erreur lors de la vérification de model");
                req.setAttribute("selectedmodel", "-1");
                e.printStackTrace();
            }
        }




        // Vérifier le champ driveType
        if (driveType == null) {
            errors.put("driveType", "Choisir driveType");
            req.setAttribute("selecteddriveType", "-1");
        } else {
            try {
                TypedQuery<Long> countQuery = em.createQuery("SELECT COUNT(c) FROM DriveType c WHERE c.driveTypeID = :driveTypeID", Long.class);
                countQuery.setParameter("driveTypeID", driveType);
                Long countResult = countQuery.getSingleResult();

                if (countResult == 0) {
                    errors.put("driveType", "driveType n'existe pas");
                    req.setAttribute("selecteddriveType", "-1");
                } else {
                    req.setAttribute("selecteddriveType", driveType);
                }
            } catch (Exception e) {
                errors.put("driveType", "Erreur lors de la vérification de driveType");
                req.setAttribute("selecteddriveType", "-1");
                e.printStackTrace();
            }
        }



        // Vérifier le champ year
        if (year == null) {
            errors.put("year", "Choisir year");
            req.setAttribute("selectedyear", "-1");
        } else {
            try {
                TypedQuery<Long> countQuery = em.createQuery("SELECT COUNT(c) FROM Year c WHERE c.yearID = :yearID", Long.class);
                countQuery.setParameter("yearID", year);
                Long countResult = countQuery.getSingleResult();

                if (countResult == 0) {
                    errors.put("year", "year n'existe pas");
                    req.setAttribute("selectedyear", "-1");
                } else {
                    req.setAttribute("selectedyear", year);
                }
            } catch (Exception e) {
                errors.put("year", "Erreur lors de la vérification de year");
                req.setAttribute("selectedyear", "-1");
                e.printStackTrace();
            }
        }



        // Vérifier le champ transmission
        if (transmission == null) {
            errors.put("transmission", "Choisir transmission");
            req.setAttribute("selectedtransmission", "-1");
        } else {
            try {
                TypedQuery<Long> countQuery = em.createQuery("SELECT COUNT(c) FROM Transmission c WHERE c.transmissionID = :transmissionID", Long.class);
                countQuery.setParameter("transmissionID", transmission);
                Long countResult = countQuery.getSingleResult();

                if (countResult == 0) {
                    errors.put("transmission", "transmission n'existe pas");
                    req.setAttribute("selectedtransmission", "-1");
                } else {
                    req.setAttribute("selectedtransmission", transmission);
                }
            } catch (Exception e) {
                errors.put("transmission", "Erreur lors de la vérification de transmission");
                req.setAttribute("selectedtransmission", "-1");
                e.printStackTrace();
            }
        }


        // Vérifier le champ fuelType
        if (fuelType == null) {
            errors.put("fuelType", "Choisir fuelType");
            req.setAttribute("selectedfuelType", "-1");
        } else {
            try {
                TypedQuery<Long> countQuery = em.createQuery("SELECT COUNT(c) FROM FuelType c WHERE c.fuelTypeID = :fuelTypeID", Long.class);
                countQuery.setParameter("fuelTypeID", fuelType);
                Long countResult = countQuery.getSingleResult();

                if (countResult == 0) {
                    errors.put("fuelType", "fuelType n'existe pas");
                    req.setAttribute("selectedfuelType", "-1");
                } else {
                    req.setAttribute("selectedfuelType", fuelType);
                }
            } catch (Exception e) {
                errors.put("fuelType", "Erreur lors de la vérification de fuelType");
                req.setAttribute("selectedfuelType", "-1");
                e.printStackTrace();
            }
        }



        // Vérifier le champ cylinders
        if (cylinders == null) {
            errors.put("cylinders", "Choisir cylinders");
            req.setAttribute("selectedcylinders", "-1");
        } else {
            try {
                TypedQuery<Long> countQuery = em.createQuery("SELECT COUNT(c) FROM Cylinders c WHERE c.cylindersID = :cylindersID", Long.class);
                countQuery.setParameter("cylindersID", cylinders);
                Long countResult = countQuery.getSingleResult();

                if (countResult == 0) {
                    errors.put("cylinders", "cylinders n'existe pas");
                    req.setAttribute("selectedcylinders", "-1");
                } else {
                    req.setAttribute("selectedcylinders", cylinders);
                }
            } catch (Exception e) {
                errors.put("cylinders", "Erreur lors de la vérification de cylinders");
                req.setAttribute("selectedcylinders", "-1");
                e.printStackTrace();
            }
        }



        // Vérifier le champ color
        if (color == null) {
            errors.put("color", "Choisir color");
            req.setAttribute("selectedcolor", "-1");
        } else {
            try {
                TypedQuery<Long> countQuery = em.createQuery("SELECT COUNT(c) FROM Color c WHERE c.colorID = :colorID", Long.class);
                countQuery.setParameter("colorID", color);
                Long countResult = countQuery.getSingleResult();

                if (countResult == 0) {
                    errors.put("color", "color n'existe pas");
                    req.setAttribute("selectedcolor", "-1");
                } else {
                    req.setAttribute("selectedcolor", color);
                }
            } catch (Exception e) {
                errors.put("color", "Erreur lors de la vérification de color");
                req.setAttribute("selectedcolor", "-1");
                e.printStackTrace();
            }
        }


        // Vérifier le champ doors
        if (doors == null) {
            errors.put("doors", "Choisir doors");
            req.setAttribute("selecteddoors", "-1");
        } else {
            try {
                TypedQuery<Long> countQuery = em.createQuery("SELECT COUNT(c) FROM Doors c WHERE c.doorsID = :doorsID", Long.class);
                countQuery.setParameter("doorsID", doors);
                Long countResult = countQuery.getSingleResult();

                if (countResult == 0) {
                    errors.put("doors", "doors n'existe pas");
                    req.setAttribute("selecteddoors", "-1");
                } else {
                    req.setAttribute("selecteddoors", doors);
                }
            } catch (Exception e) {
                errors.put("doors", "Erreur lors de la vérification de doors");
                req.setAttribute("selecteddoors", "-1");
                e.printStackTrace();
            }
        }








        // verification de nombre et lextension et la taille des images
        String erorimage ="";
        Collection<Part> fileParts = req.getParts();


        int countimage = 0;
        for (Part filePart : fileParts)
        {
            String fileName = getFileName(filePart);
            if (fileName != null)
            {
                countimage++;
                //verifier size
                if (filePart.getSize() > 2 * 1024 * 1024)
                {
                    erorimage = "La taille de chaque image doit etre < 2 MG";
                    break;
                }

                //verifier extension
                if (!fileName.toLowerCase().endsWith(".jpg") && !fileName.toLowerCase().endsWith(".jpeg") &&
                        !fileName.toLowerCase().endsWith(".png") && !fileName.toLowerCase().endsWith(".gif")) {
                    erorimage = "Les fichier Aploder doit etre des image";
                    break;
                }
            }
        }

        if(countimage==0)
        {
            erorimage = "Les image est obigatoire";
        }


        if (!erorimage.equals("")) {
            errors.put("images", erorimage);
        }





        // Verifier les features selectionne par l'utilisateur
        ArrayList<Integer> Myfeatures = new ArrayList<Integer>();
        if (selectedFeatures != null && selectedFeatures.length > 0) {
            for (String feature : selectedFeatures)
            {
                try {
                    TypedQuery<Long> countQuery = em.createQuery("SELECT COUNT(c) FROM Features c WHERE c.featureID = :featureID", Long.class);
                    countQuery.setParameter("featureID", feature);
                    Long countResult = countQuery.getSingleResult();
                    if (countResult == 0) {
                        errors.put("features", "features n'existe pas");
                        break;
                    }
                    else
                    {
                        Myfeatures.add(Integer.valueOf(feature));
                    }
                } catch (Exception e) {
                    errors.put("doors", "Erreur lors de la vérification de features");
                    req.setAttribute("selecteddoors", "-1");
                    e.printStackTrace();
                }
            }
        }





        //charger les input avec les valeur saisie par l'utilisateur
        req.setAttribute("listingTitle",listingTitle);
        req.setAttribute("price",price);
        req.setAttribute("mileage",mileage);
        req.setAttribute("engineSize",engineSize);
        req.setAttribute("vin",vin);
        req.setAttribute("tags",tags);
        req.setAttribute("description",description);





        req.setAttribute("Name","kadi");
        req.setAttribute("Email","kadi@gmail.com");
        req.setAttribute("Phone","0682653265");




        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            doGet(req, resp);
        }
        else
        {

            /*
            // creer lobjet listing
            try {
                em.getTransaction().begin();

                AddListing listing = new AddListing();
                listing.setUserID(1);
                listing.setTitle(listingTitle);
                listing.setConditionTID(Integer.parseInt(condition));
                listing.setBodyTypeID(Integer.parseInt(bodyType));
                listing.setMakeID(Integer.parseInt(makeBrand));
                listing.setModelID(Integer.parseInt(model));
                listing.setPrice(new BigDecimal(price));
                listing.setYearID(Integer.parseInt(year));
                listing.setDriveTypeID(Integer.parseInt(driveType));
                listing.setTransmissionID(Integer.parseInt(transmission));
                listing.setFuelTypeID(Integer.parseInt(fuelType));
                listing.setMileage(Integer.parseInt(mileage));
                listing.setEngineSize(new BigDecimal(engineSize));
                listing.setCylindersID(Integer.parseInt(cylinders));
                listing.setColorID(Integer.parseInt(color));
                listing.setDoorsID(Integer.parseInt(doors));
                listing.setVin(vin);
                listing.setTags(tags);
                listing.setDescription(description);

                em.persist(listing);

                em.getTransaction().commit();
            } catch (Exception e)
            {
                if (em.getTransaction().isActive()) {
                    em.getTransaction().rollback();
                }
                e.printStackTrace();
            } finally {
                em.close();
                JPAUtil.close();
            }

            */


            //Fitures de voiture
            System.out.println("list : "+Myfeatures.toString());


            //aploder les image au serveur et metre dans la base de donnee
            for (Part filePart : fileParts)
            {
                String fileName = getFileName(filePart);
                if (fileName != null)
                {
                    String hashedFileName = hashFileName(fileName);
                    String uploadDirectory = "C:\\Users\\MO KADI\\Desktop\\Nouveau dossier";
                    Path uploadPath = Path.of(uploadDirectory, hashedFileName);
                    try (InputStream fileContent = filePart.getInputStream())
                    {
                        Files.copy(fileContent, uploadPath);
                        String imageUrl = uploadPath.toString();

                        System.out.println(imageUrl);
                        //inserer limage a la base de donnee


                    } catch (FileAlreadyExistsException e)
                    {
                        System.out.println("Une image avec le même nom existe déjà sur le serveur.");
                    } catch (Exception e)
                    {
                        System.out.println("Erreur lors du téléchargement de l'image '" + fileName + "'.");
                        e.printStackTrace();
                    }
                }
            }




        }
    }









    private String getFileName(Part part) {
        String submittedFileName = part.getSubmittedFileName();
        if (submittedFileName != null && !submittedFileName.isEmpty()) {
            return submittedFileName;
        }
        return null;
    }



    private String hashFileName(String fileName) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmss");
            String currentTimeStamp = dateFormat.format(new Date());

            String fileNameWithTimestamp = fileName + "-" + currentTimeStamp;

            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(fileNameWithTimestamp.getBytes());
            byte[] bytes = md.digest();

            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                sb.append(String.format("%02x", b));
            }

            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return fileName;
        }
    }

}
