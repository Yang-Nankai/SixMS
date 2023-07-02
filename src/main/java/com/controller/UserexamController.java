package com.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.UserexamEntity;
import com.entity.YonghuEntity;
import com.service.UserexamService;
import com.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 支付记录
 * 后端接口
 * @author
 * @email
 * @date 2023-06-30 14:39:54
 */

@RestController
@RequestMapping("/userexam")
public class UserexamController {

    @Autowired
    private UserexamService userexamService;

    /**
     * 查看是否支付成功并保存
     */
    @GetMapping("/pay")
    public R pay(Long userId, Long paperId, HttpServletRequest request) {
        UserexamEntity userexam = userexamService.selectOne(
                new EntityWrapper<UserexamEntity>()
                        .eq("userid", userId)
                        .eq("paperid", paperId)
        );
        if(userexam != null && userexam.getSignup().equals(1)) {
            return R.error("重复支付");
        }
        UserexamEntity ue = new UserexamEntity();
        ue.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
        ue.setAddtime(new Date());
        ue.setUserid(userId);
        ue.setSignup(1);
        ue.setPaperid(paperId);
        ue.setUsername(" ");
        ue.setPapername(" ");
        ue.setCost(0);
        userexamService.insert(ue);
        return R.ok();
    }

    /**
     * 查看是否支付成功
     */
    @GetMapping("/query")
    public R query(Long userId, Long paperId, HttpServletRequest request) {
        UserexamEntity userexam = userexamService.selectOne(
                new EntityWrapper<UserexamEntity>()
                        .eq("userid", userId)
                        .eq("paperid", paperId)
        );
        if(userexam != null && userexam.getSignup().equals(1)) {
            return R.ok();
        }else{
            return R.error("未支付");
        }
    }
}
