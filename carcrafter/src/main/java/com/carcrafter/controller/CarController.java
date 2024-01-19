package com.carcrafter.controller;

import java.io.IOException;
import java.util.*;

import com.carcrafter.Factory.ServiceFactory;
import com.carcrafter.FileUtility.FileService;
import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.*;

import com.carcrafter.service.CarService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@WebServlet("/AddListing")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,  // 1 MB
        maxFileSize = 10 * 1024 * 1024,   // 10 MB
        maxRequestSize = 10 * 1024 * 1024  // 10 MB
)
public class CarController extends HttpServlet {

    private final CarService carService;
    public CarController() throws IllegalAccessException, InstantiationException {
        this.carService = ServiceFactory.createService(CarService.class);
    }


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

        }

        List<ConditionT> ConditionTs = carService.SelectConditionT();
        List<BodyType> bodyTypes = carService.SelectBodyType();
        List<MakeBrand> makeBrands = carService.SelectMakeBrand();
        List<Model> models = carService.SelectModel();
        List<Year> years = carService.SelectYear();
        List<DriveType> driveTypes = carService.SelectDriveType();
        List<Transmission> transmissions = carService.SelectTransmission();
        List<FuelType> fuelTypes = carService.SelectFuelType();
        List<Cylinders> cylinders = carService.SelectCylinders();
        List<Color> colors = carService.SelectColor();
        List<Doors> doorsList = carService.SelectDoors();
        List<Features> featureList = carService.SelectFeatures();

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
        String pattern = "^[a-zA-Z0-9_.\\- ]{5,20}$";
        if (listingTitle == null || listingTitle.isEmpty() || !listingTitle.matches(pattern)) {
            errors.put("listingTitle", "Le titre de l'annonce doit contenir entre 5 et 20 caractères.");
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
        String tagsPattern = "^[a-zA-Z0-9_\\-. ]+(?:,[a-zA-Z0-9_\\-. ]+)*$";
        if (tags == null || tags.isEmpty() || !tags.matches(tagsPattern)) {
            errors.put("tags", "Les tags doivent être séparés par des virgules.");
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
            Long countResult = carService.SelectcConditionCount(condition);
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
            Long countResult = carService.SelectcBodyTypeCount(bodyType);
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
                Long countResult = carService.SelectcBrandCount(makeBrand);

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
                Long countResult = carService.SelectcModelCount(model);
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
                Long countResult = carService.SelectDriveTypeCount(driveType);

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
                Long countResult = carService.SelectYearTypeCount(year);
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
                Long countResult = carService.SelectTransmissionCount(transmission);

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
                Long countResult = carService.SelecFuelTypeCount(fuelType);

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
                Long countResult = carService.SelectCylindersCount(cylinders);

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
                Long countResult = carService.SelectColorCount(color);

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
                Long countResult = carService.SelectDoorsCount(doors);

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
            String fileName = FileService.getFileName(filePart);
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





        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            doGet(req, resp);
        }
        else
        {
            HttpSession session = req.getSession(false);
            Integer userId = (Integer) session.getAttribute("id");
            Boolean ajoutcar = carService.SaveListing(userId,listingTitle,condition,bodyType,makeBrand,model,price,year,driveType,transmission,fuelType,mileage,engineSize,cylinders,color,doors,vin,tags,description);

            if (ajoutcar)
            {
                int maxListingID = carService.SelectmaxListingID();
                carService.SaveFeacherListing(maxListingID,Myfeatures);
                String uploadDirectory = getServletContext().getRealPath("/assets/upload/img/car");
                carService.SaveImageListing( maxListingID,fileParts,uploadDirectory);
            }
            resp.sendRedirect("ProfileListing");

        }
    }

}
