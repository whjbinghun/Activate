#ifndef COMMON_ENUM_H
#define COMMON_ENUM_H

enum EHttpErrorNo {     //Http错误码
    e_success = 200, //成功
    e_unableDecrypt = 400, //无法解密
    e_error = 401,
    e_permitError = 502, //通行证错误
};

enum EAudit {           //审核状态
    e_pending_active = 1, //等待激活
    e_pending_lock = 2,   //等待锁定
    e_active_suc = 3,     //激活成功
    e_lock_suc = 4,       //锁定成功
    e_refuse_active = 5,  //拒绝激活
    e_refuse_lock = 6,    //拒绝锁定
};

//enum EServerHttpErrorCode{
//    e_connectError = -1,
//    e_success = 0, // 成功
//    e_paramError = 1, // 参数错误，未找到参数
//    e_paramSignError = 2, // 数字签名错误
//    e_accessTokenError = 3,// access_token,错误
//    e_noAccessPos = 4, // POS授权错误
//    e_userNameOrPasswordError = 1001, // 用户名或密码错误
//    e_userPosNotBelongShopError = 1002, // 用户和Pos不属于同一门店
//    e_corpIDError = 3001, // 企业编号错误
//    e_shopIDError = 3002, // 门店编号错误
//    e_posRegisted = 4001, // 设备已注册
//    e_posNotRegist = 5001, // 设备未注册
//};

#endif // COMMON_ENUM_H
