package com.carcrafter.Factory;

import com.carcrafter.service.HomeService;

public class ServiceFactory<T>
{
    public static <T> T createService(Class<T> serviceClass) throws IllegalAccessException, InstantiationException {
        return serviceClass.newInstance();
    }
}
