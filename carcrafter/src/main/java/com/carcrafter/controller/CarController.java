package com.carcrafter.controller;

import java.io.Console;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.FileAlreadyExistsException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

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


            request.setAttribute("Name","gggg");
            request.setAttribute("Email","ggg");
            request.setAttribute("Phone","eeee");

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

        String[] selectedFeatures = req.getParameterValues("feature");






        Map<String, String> errors = new HashMap<>();

        String pattern = "^[a-zA-Z0-9]{5,20}$";
        if (listingTitle == null || listingTitle.isEmpty() || !listingTitle.matches(pattern)) {
            errors.put("listingTitle", "Le titre de l'annonce doit contenir entre 5 et 20 caractères et ne peut inclure que des lettres et des chiffres.");
        }

        String pricePattern = "^(\\d{1,10})(\\.\\d{1,2})?$";

        if (price == null || price.isEmpty() || !price.matches(pricePattern)) {
            errors.put("price", "Le prix doit être un nombre valide avec jusqu'à 2 chiffres après la virgule");
        }

        String mileagePattern = "^(\\d{1,10})(\\.\\d{1,2})?$";

        if (mileage == null || mileage.isEmpty() || !mileage.matches(mileagePattern)) {
            errors.put("mileage", "Le mileage doit être un nombre valide avec jusqu'à 2 chiffres après la virgule");
        }


        String engineSizePattern = "^[1-9]\\d{3,}$";

        if (engineSize == null || engineSize.isEmpty() || !engineSize.matches(engineSizePattern)) {
            errors.put("engineSize", "La taille du moteur doit être un nombre entier supérieur à 1000");
        }

        String vinPattern = "^[A-HJ-NPR-Z0-9]{17}$";

        if (vin == null || vin.isEmpty() || !vin.matches(vinPattern)) {
            errors.put("vin", "Le numéro de VIN doit être composé de 17 caractères alphanumériques (sauf I, O, Q)");
        }


        String tagsPattern = "^[a-zA-Z0-9]+(?:,[a-zA-Z0-9]+)*$";

        if (tags == null || tags.isEmpty() || !tags.matches(tagsPattern)) {
            errors.put("tags", "Les tags doivent être séparés par des virgules et ne peuvent contenir que des lettres et des chiffres");
        }


        if (description == null || description.isEmpty()) {
            errors.put("description", "La description est requise.");
        }

        boolean etat_images = true;

        Collection<Part> fileParts = req.getParts();

        if(fileParts.isEmpty())
        {
            etat_images = false;
        }

        for (Part filePart : fileParts)
        {
            String fileName = getFileName(filePart);

            if (fileName != null)
            {
                //verifier size
                if (filePart.getSize() > 2 * 1024 * 1024)
                {
                    etat_images = false;
                    break;
                }

                //verifier extension
                if (!fileName.toLowerCase().endsWith(".jpg") && !fileName.toLowerCase().endsWith(".jpeg") &&
                        !fileName.toLowerCase().endsWith(".png") && !fileName.toLowerCase().endsWith(".gif")) {
                    etat_images = false;
                    break;
                }


                /*
                String hashedFileName = hashFileName(fileName);
                String uploadDirectory = "C:\\Users\\MO KADI\\Desktop\\Nouveau dossier";
                Path uploadPath = Path.of(uploadDirectory, hashedFileName);
                try (InputStream fileContent = filePart.getInputStream())
                {
                    Files.copy(fileContent, uploadPath);
                    String imageUrl = "C:\\Users\\MO KADI\\Desktop\\Nouveau dossier\\" + hashedFileName;
                }
                catch (FileAlreadyExistsException e)
                {
                    System.out.println("Une image avec le même nom existe déjà sur le serveur.");
                }
                catch (Exception e) {
                    System.out.println("Erreur lors du téléchargement de l'image '" + fileName + "'.");
                }*/

            }
        }


        if (!etat_images) {
            errors.put("images", "Aploder les vrais images");
        }


        System.out.println(etat_images);






        if (selectedFeatures != null && selectedFeatures.length > 0) {
            for (String feature : selectedFeatures)
            {
                System.out.println("Feature selected: " + feature);
            }
        }
        else
        {
            System.out.println("Aucune fonctionnalité sélectionnée.");
        }



        //charger les input
        req.setAttribute("listingTitle",listingTitle);
        req.setAttribute("price",price);
        req.setAttribute("mileage",mileage);
        req.setAttribute("engineSize",engineSize);
        req.setAttribute("vin",vin);
        req.setAttribute("tags",tags);
        req.setAttribute("description",description);



        req.setAttribute("selectedcondition", (condition != null) ? condition : "-1");
        req.setAttribute("selectedbodyType", (bodyType != null) ? bodyType : "-1");
        req.setAttribute("selectedmakeBrand", (makeBrand != null) ? makeBrand : "-1");
        req.setAttribute("selectedmodel", (model != null) ? model : "-1");
        req.setAttribute("selecteddriveType", (driveType != null) ? driveType : "-1");
        req.setAttribute("selectedyear", (year != null) ? year : "-1");
        req.setAttribute("selectedtransmission", (transmission != null) ? transmission : "-1");
        req.setAttribute("selectedfuelType", (fuelType != null) ? fuelType : "-1");
        req.setAttribute("selectedcylinders", (cylinders != null) ? cylinders : "-1");
        req.setAttribute("selectedcolor", (color != null) ? color : "-1");
        req.setAttribute("selecteddoors", (doors != null) ? doors : "-1");



        req.setAttribute("Name","gggg");
        req.setAttribute("Email","ggg");
        req.setAttribute("Phone","eeee");




        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            doGet(req, resp);
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
