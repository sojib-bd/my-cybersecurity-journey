<?php 
//**      php functions   ***
---------------------------------
function myPhp() {
    echo "This is a php function<br>";
}

myPhp();

//function with arguments
function carCollection($car){
    echo "I have a red $car<br>";
}
carCollection("BMW"); // I have a red BMW;
carCollection("Volvo");// I have a red Volvo;
carCollection("Pazaro");// I have a red pazaro;
carCollection("Suzuki"); // I have a red suzuki;





//php default argument value
-------------------------------
  
function setHeight($minHeight = 50) {
    echo "The height is : $minHeight <br>";
}

setHeight(350);// The height is 350;
setHeight(); // The heigh is 50;
setHeight(150);// The height is 150;
setHeight(80);// The height is 80;

// PHP Functions - Returning values
-----------------------------------
  
function sum($x,$y){
    $z = $x + $y;
    return $z;
}

echo "5 + 10 = " . sum(5,10) . "<br>";// 5+10 = 15;
echo "7 + 20 = " . sum(7,20) . "<br>";// 7+20 = 27;





// Passing Arguments by Reference
--------------------------------------


function add_five(&$value){
    $value += 5;
}

$num = 2;
add_five($num);
echo "$num <br>";// 7;




/* Variable Number of Arguments
--------------------------------
By using the "..." operator in front of the function parameter, 
the function accepts an unknown number of arguments. This is also called a variadic function.

The variadic function argument becomes an array. */

function sumMyNumber(...$x) {
    $n = 0;
    $len = count($x);
    for($i = 0; $i < $len; $i++){
        $n += $x[$i];
    }
    return $n;
}

$a = sumMyNumber(2,5,7,9,8);
echo "The result is $a<br>";

?>
