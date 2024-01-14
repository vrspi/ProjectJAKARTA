package com.carcrafter.Factory;

import com.carcrafter.service.UserService;

public class UserServiceFactory {
    public static UserService createUserService() {
        return new UserService();
    }
}
