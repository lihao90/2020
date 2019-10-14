<?php
   function get_rand_str($length=4){
      $chars = '1234567890ABCDEFGHJKLMNPQRSTUVWXYZ';
    //   随机地打乱字符串中的所有字符：
      $str=str_shuffle($chars);
    //substr() 方法可在字符串中抽取从 start 下标开始的指定数目的字符
      $str=substr($str,0,$length);
    // 转换为小写
      $str=strtolower($str);
      return $str;

   }
   $width=130;
   $height=40;
//imagecreatetruecolor — 新建一个真彩色图像  imagecreatetruecolor ( int $width , int $height ) : resource
   $img=imagecreatetruecolor($width,$height);

   //背景颜色  ->为一幅图像分配颜色 imagecolorallocate ( resource $image , int $red , int $green , int $blue )
   $backgroundcolor = imagecolorallocate($img,74,147,223);

   //文字颜色
   $textcolor = imagecolorallocate($img,255,255,255);

   //画一举行并填充
   imagefilledrectangle($img,0,0,$width,$height,$backgroundcolor);

   //获取随机字符串
   $code = get_rand_str();


   //水平地画一行字符串
   imagettftext($img,30,0,21,32,$textcolor,"../assets/admin/fonts/IrishGrover.ttf",$code);
   //在图片当中画一些点，防止有人而已破解验证码
   for($i=0;$i<=100;$i++){
       $color=imagecolorallocate($img,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));

       //从一个范围里面选值 mt_rand — 生成更好的随机数
       $x=mt_rand(0,$width);
       $y=mt_rand(0,$height);
       imagesetpixel($img,$x,$y,$color);
      
   }

   //session_start() 会创建新会话或者重用现有会话。
   // 如果通过 GET 或者 POST 方式，或者使用 cookie 提交了会话 ID， 则会重用现有会话
   session_start();
   //获取现有的会话值
   $_SESSION['imgcode']=$code;

   header("Content-Type:image/png;");

   //输出图片
   imagepng($img);

   //把资源销毁
   imagedestroy($img);


?>