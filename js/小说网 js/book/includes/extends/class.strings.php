<?php
class Strings
{
    function randomStr($length =10,$other=true)
    {
    $chars = array('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 

    'i', 'j', 'k', 'l','m', 'n', 'o', 'p', 'q', 'r', 's', 

    't', 'u', 'v', 'w', 'x', 'y','z', 'A', 'B', 'C', 'D', 

    'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L','M', 'N', 'O', 

    'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y','Z', 

    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'); 

    if($other)
    {
      $otherArr = ['!','@','#', '$', '%', '^', '&', '*', '(', ')', '-', '_','[', ']', '{', '}', '<', '>', '~', '`', '+', '=', ',','.', ';', ':', '/', '?', '|'];
      $chars = array_merge($chars,$otherArr);
    }


    $keys=array_rand($chars,$length);
    $password='';
    for($i=0;$i<$length;$i++)
    {
        $password .=$chars[$keys[$i]];
    }
    return $password;
    }
}
?>