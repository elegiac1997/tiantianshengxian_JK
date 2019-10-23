package com.qf.realm;

import com.qf.pojo.User;
import com.qf.service.userService;
import lombok.Setter;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.web.context.ContextLoader;

@Setter
public class MyRealm extends AuthorizingRealm {
    private userService userService;
    
    
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        System.out.println("调用realm、在realm中查询权限");
        //获取当前用户的用户名
        String username = (String) principals.getPrimaryPrincipal();
        
        
        

        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
//        System.out.println("在Realm中查询身份");
        // 获取用户登录时发送来的用户名
        String username = (String)token.getPrincipal();
        // 查询用户信息： UserService:public User queryUserByUsername(String username);
        userService userService = ContextLoader.getCurrentWebApplicationContext().getBean("userServiceImpl", userService.class);
        //查询到用户信息
        User user = userService.checkUserName(username);
        //判断用户信息是否为null
        if(user==null){//不存在用户名
            return null;//在后续流程中会抛出异常  UnknownAccountException
        }
        // 将用户信息封装在  AuthenticationInfo 中
        /*return new SimpleAuthenticationInfo(user.getUsername(),//数据库中用户名
                                     user.getPassword(), //数据库中的密码
                                     this.getName());*/// realm的标识
        return new SimpleAuthenticationInfo(user.getUsername(),
                user.getPassword(),
                ByteSource.Util.bytes(user.getSalt()),
                this.getName());

    }
}
