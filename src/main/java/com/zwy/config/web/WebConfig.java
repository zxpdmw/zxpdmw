package com.zwy.config.web;

import com.zwy.config.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @Description: 自定义mvc配置
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {
    /**
    * @Description: addViewControllers 添加视图控制器
    * @Param: [registry]
    * @return: void
    * @Author: ZXP
    * @Date: 2020/6/28-11:11
    */
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/admin").setViewName("admin/login");
        registry.addViewController("/about").setViewName("about");
        registry.addViewController("/music").setViewName("music");
//        registry.addViewController("/message").setViewName("message");

    }

    /**
    * @Description: addInterceptors 添加拦截器
    * @Param: [registry]
    * @return: void
    * @Author: ZXP
    * @Date: 2020/6/28-11:11
    */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/admin/**")
                .excludePathPatterns("/admin")
                .excludePathPatterns("/admin/login");
    }
}
