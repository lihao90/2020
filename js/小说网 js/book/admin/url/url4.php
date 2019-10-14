<?php
// 把整个文件读入一个字符串中
$str = file_get_contents($url);
$listReg= "/<ul class=\"cf\">\s*<li.*>(.*)<\/li>\s*<\/ul>/imsU";
  preg_match($listReg,$str,$res);

  $lilist=$res[1];
  $liReg="/<a.*href=\"(.*)\".*>(.*)<\/a>/imsU";
  preg_match_all($liReg,$lilist,$result);
  $urllist=$result[1];
  $titlelist=$result[2];
  $chapterList=[];
  foreach($urllist as $key=>$item)
  {
    // $str = file_get_contents("demo.txt");
      $str=file_get_contents($item);
      $contentReg="/<div\s*class=\"read_content\"\s*.*>(.*)<\/div>/imsU";
      preg_match($contentReg,$str,$text);
      $content=strip_tags($text[1]);
      $title=$titlelist[$key];
      // $message="$title\r\n\r\n $content\r\n\r\n";
      // file_put_contents("book1.txt",$message,FILE_APPEND);
      $arr = array("title"=>$titlelist[$key],"content"=>strip_tags($content));
    $json = json_encode($arr);
    //保存文件
    $time = date("Ymd");
    $path = APP_PATH."/assets/book/$time";
    if(!is_dir($path))
    {
      mkdir($path,0777,true);
    }
    $filename = $Strings->randomStr(20,false).".json";
    $length = @file_put_contents($path."/".$filename,$json);
    if($length > 0)
    {
      $chapterList[] = array(
        "register_time"=>time(),
        "title"=>$title,
        "content"=>"/book/$time/$filename",
        "bookid"=>$bookid
      );
    }

  }
?>