package com.carcrafter.service;

import com.carcrafter.FileUtility.FileService;
import com.carcrafter.model.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

public class CarService {

    public boolean SaveListing(int userId,String listingTitle,String condition,String bodyType,String makeBrand,String
            model,String price,String year ,String driveType, String transmission,String fuelType,String mileage, String engineSize,
            String cylinders,String color,String doors,String vin,String tags,String description)
    {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        try
        {

            Listing listing = new Listing();
            listing.setUserID(userId);
            listing.setTitle(listingTitle);
            ConditionT conditionEntity = new ConditionT();
            conditionEntity.setConditionTID(Integer.parseInt(condition));
            BodyType bodyTypeEntity = new BodyType();
            bodyTypeEntity.setBodyTypeID(Integer.parseInt(bodyType));
            MakeBrand makeEntity = new MakeBrand();
            makeEntity.setMakeID(Integer.parseInt(makeBrand));
            Model modelEntity = new Model();
            modelEntity.setModelID(Integer.parseInt(model));
            listing.setCondition(conditionEntity);
            listing.setBodyType(bodyTypeEntity);
            listing.setMakeBrand(makeEntity);
            listing.setModel(modelEntity);
            listing.setPrice(new BigDecimal(price));
            Year yearEntity = new Year();
            DriveType driveTypeEntity = new DriveType();
            Transmission transmissionEntity = new Transmission();
            FuelType fuelTypeEntity = new FuelType();


            yearEntity.setYearID(Integer.parseInt(year));
            driveTypeEntity.setDriveTypeID(Integer.parseInt(driveType));
            transmissionEntity.setTransmissionID(Integer.parseInt(transmission));
            fuelTypeEntity.setFuelTypeID(Integer.parseInt(fuelType));

            listing.setYear(yearEntity);
            listing.setDriveType(driveTypeEntity);
            listing.setTransmission(transmissionEntity);
            listing.setFuelType(fuelTypeEntity);

            listing.setMileage(Integer.parseInt(mileage));
            listing.setEngineSize(new BigDecimal(engineSize));

            Cylinders cylindersEntity = new Cylinders();
            Color colorEntity = new Color();
            Doors doorsEntity = new Doors();


            cylindersEntity.setCylindersID(Integer.parseInt(cylinders));
            colorEntity.setColorID(Integer.parseInt(color));
            doorsEntity.setDoorsID(Integer.parseInt(doors));
            listing.setCylinders(cylindersEntity);
            listing.setColor(colorEntity);
            listing.setDoors(doorsEntity);

            listing.setVin(vin);
            listing.setTags(tags);
            listing.setDescription(description);

            em.persist(listing);
            em.getTransaction().commit();
            return  true;
        } catch (Exception e)
        {
            if (em.getTransaction().isActive())
            {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return  false;
        }
        finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }

    public boolean SaveFeacherListing(int maxListingID, ArrayList<Integer> Myfeatures)
    {
        EntityManager em = JPAUtil.getEntityManager();
        Listing lst = new Listing();
        lst.setListingID(maxListingID);

        //System.out.println("list : " + Myfeatures.toString());
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();

            for (int i = 0; i < Myfeatures.size(); i++) {
                Features ftc = new Features();
                ftc.setFeatureID(Myfeatures.get(i));
                ListingFeature lf = new ListingFeature();
                lf.setListing(lst);
                lf.setFeature(ftc);

                em.persist(lf);
            }

            transaction.commit();
            return  true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
        finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }


    public boolean SaveImageListing(int maxListingID,Collection<Part> fileParts)
    {
        EntityManager em = JPAUtil.getEntityManager();
        Listing lst = new Listing();
        lst.setListingID(maxListingID);

        EntityTransaction transaction2 = em.getTransaction();

        try {
            transaction2.begin();

            for (Part filePart : fileParts) {
                String fileName = FileService.getFileName(filePart);

                if (fileName != null) {
                    String hashedFileName = FileService.hashFileName(fileName);

                    // Définir le répertoire d'upload
                    String uploadDirectory = "C:\\Users\\MO KADI\\Desktop\\ProjectJAKARTA\\carcrafter\\src\\main\\webapp\\assets\\upload\\img\\car";

                    // chemin server
                    //String uploadDirectory = getServletContext().getRealPath("/assets/upload/img/car");

                    Path uploadPath = Paths.get(uploadDirectory, hashedFileName);

                    try (InputStream fileContent = filePart.getInputStream()) {
                        Files.createDirectories(uploadPath.getParent());

                        // Vérifiez si le fichier existe déjà
                        if (Files.notExists(uploadPath)) {
                            Files.copy(fileContent, uploadPath);
                            String imageUrl = "assets/upload/img/car/" + hashedFileName;
                            System.out.println("Image téléchargée avec succès : " + imageUrl);

                            // Insérer l'image dans la base de données
                            Image img = new Image();
                            img.setImagePath(hashedFileName);
                            img.setListing(lst);
                            em.persist(img);
                        } else {
                            System.out.println("Une image avec le même nom existe déjà dans le dossier d'upload.");
                        }
                    } catch (IOException e) {
                        System.out.println("Erreur lors du téléchargement de l'image '" + fileName + "'.");
                        e.printStackTrace();
                    }
                }
            }

            transaction2.commit();
            return  true;
        }catch(Exception e)
        {
            return  false;
        }
        finally
        {
            if (em.isOpen()) {
                em.close();
            }
        }
    }

    public List<ConditionT>  SelectConditionT()
    {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<ConditionT> queryConditionT = em.createQuery("SELECT c FROM ConditionT c", ConditionT.class);
        List<ConditionT> ConditionTs = queryConditionT.getResultList();
        em.close();
        return ConditionTs;
    }

    public List<BodyType>  SelectBodyType()
    {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<BodyType> queryBodyType = em.createQuery("SELECT b FROM BodyType b", BodyType.class);
        List<BodyType> bodyTypes = queryBodyType.getResultList();
        em.close();
        return bodyTypes;
    }


    public List<MakeBrand>   SelectMakeBrand()
    {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<MakeBrand> queryMakeBrand = em.createQuery("SELECT m FROM MakeBrand m", MakeBrand.class);
        List<MakeBrand> makeBrands = queryMakeBrand.getResultList();
        em.close();
        return makeBrands;
    }

    public List<Model> SelectModel()
    {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Model> queryModel = em.createQuery("SELECT m FROM Model m", Model.class);
        List<Model> models = queryModel.getResultList();
        em.close();
        return models;
    }

    public List<Year> SelectYear()
    {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Year> queryYear = em.createQuery("SELECT y FROM Year y", Year.class);
        List<Year> years = queryYear.getResultList();
        em.close();
        return years;
    }


    public List<DriveType> SelectDriveType()
    {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<DriveType> queryDriveType = em.createQuery("SELECT d FROM DriveType d", DriveType.class);
        List<DriveType> driveTypes = queryDriveType.getResultList();
        em.close();
        return driveTypes;
    }


    public List<Transmission> SelectTransmission()
    {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Transmission> queryTransmission = em.createQuery("SELECT t FROM Transmission t", Transmission.class);
        List<Transmission> transmissions = queryTransmission.getResultList();
        em.close();
        return transmissions;
    }



    public List<FuelType> SelectFuelType()
    {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<FuelType> queryFuelType = em.createQuery("SELECT f FROM FuelType f", FuelType.class);
        List<FuelType> fuelTypes = queryFuelType.getResultList();
        em.close();
        return fuelTypes;
    }



    public List<Cylinders> SelectCylinders()
    {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Cylinders> queryCylinders = em.createQuery("SELECT c FROM Cylinders c", Cylinders.class);
        List<Cylinders> cylinders = queryCylinders.getResultList();
        em.close();
        return cylinders;
    }


    public List<Color> SelectColor()
    {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Color> queryColor = em.createQuery("SELECT c FROM Color c", Color.class);
        List<Color> colors = queryColor.getResultList();
        em.close();
        return colors;
    }


    public List<Doors> SelectDoors()
    {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Doors> queryDoors = em.createQuery("SELECT d FROM Doors d", Doors.class);
        List<Doors> doorsList = queryDoors.getResultList();
        em.close();
        return doorsList;
    }



    public List<Features> SelectFeatures()
    {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Features> querFeatures = em.createQuery("SELECT f FROM Features f", Features.class);
        List<Features> featureList = querFeatures.getResultList();
        em.close();
        return featureList;
    }


    public int SelectmaxListingID()
    {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Integer> countQuery = em.createQuery("SELECT MAX(l.listingID) FROM Listing l", Integer.class);
        int maxListingID = countQuery.getSingleResult();
        em.close();
        return maxListingID;
    }


    public List<Listing> SelectAllListings()
    {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Listing> query = em.createQuery("SELECT L FROM Listing L", Listing.class);
        List<Listing> listings = query.getResultList();
        return listings;
    }


    public Boolean DeleteListing(long listingId)
    {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            Listing listing = em.find(Listing.class, listingId);

            if (listing != null)
            {
                em.remove(listing);
                em.getTransaction().commit();
                return  true;
            }
            else
            {
                return false;
            }
        }
        catch (Exception e)
        {
            if (em.getTransaction().isActive())
            {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        }
        finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }




}
