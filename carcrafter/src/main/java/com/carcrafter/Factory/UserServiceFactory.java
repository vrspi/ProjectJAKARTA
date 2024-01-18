package com.carcrafter.Factory;

import com.carcrafter.service.CarService;
import com.carcrafter.service.UserService;

public class UserServiceFactory<T>
{
    public static <T> T createService(Class<T> serviceClass) throws IllegalAccessException, InstantiationException {
        return serviceClass.newInstance();
    }
}


