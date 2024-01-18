package com.carcrafter.Factory;

import com.carcrafter.service.HomeService;

public class ServiceFactory {
    public static HomeService createHomeService() {
        return new HomeService();
    }
}
