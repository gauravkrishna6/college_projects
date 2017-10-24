val rdd=sc.textFile("/home/cslab36/Desktop/sparkProg/mat/mat1.txt");

//Compute inverse of matrix//
def Inverse(a:Array[Array[Int]]):Array[Array[Double]]={
val det=(a(0)(0)*(a(1)(1)*a(2)(2)-a(1)(2)*a(2)(1))-a(0)(1)*(a(1)(0)*a(2)(2)-a(1)(2)*a(2)(0))+a(0)(2)*(a(1)(0)*a(2)(1)-a(1)(1)*a(2)(0))).toDouble;

val b=Array.ofDim[Double](3,3);
b(0)(0)=(a(1)(1)*a(2)(2)-a(1)(2)*a(2)(1)).toDouble;
b(0)(1)=(-1*(a(1)(0)*a(2)(2)-a(1)(2)*a(2)(0))).toDouble;
b(0)(2)=((a(1)(0)*a(2)(1)-a(1)(1)*a(2)(0))).toDouble;
b(1)(0)=(-1*(a(0)(1)*a(2)(2)-a(0)(2)*a(2)(1))).toDouble;
b(1)(1)=(a(0)(0)*a(2)(2)-a(0)(2)*a(2)(0)).toDouble;
b(1)(2)=(-1*(a(0)(0)*a(2)(1)-a(0)(1)*a(2)(0))).toDouble;
b(2)(0)=(a(0)(1)*a(1)(2)-a(0)(2)*a(1)(1)).toDouble;
b(2)(1)=(-1*(a(0)(0)*a(1)(2)-a(0)(2)*a(1)(0))).toDouble;
b(2)(2)=(a(0)(0)*a(1)(1)-a(0)(1)*a(1)(0)).toDouble;

val inv=Array.ofDim[Double](3,3);
for(i <- 0 to 2){
for(j <- 0 to 2){
    inv(i)(j)=(b(j)(i)/det).toDouble;
}
}

return inv;
}

//Convert to string and get inverse//
def getInv(s1:String):Array[Array[Double]]={
val numArr=s1.split(" ");
val mat=Array.ofDim[Int](3,3);
mat(0)(0)=numArr(0).toInt;
mat(0)(1)=numArr(1).toInt;
mat(0)(2)=numArr(2).toInt;
mat(1)(0)=numArr(3).toInt;
mat(1)(1)=numArr(4).toInt;
mat(1)(2)=numArr(5).toInt;
mat(2)(0)=numArr(6).toInt;
mat(2)(1)=numArr(7).toInt;
mat(2)(2)=numArr(8).toInt;

val inv=Inverse(mat);
return inv;
}

// Multiply two matrices//
def multiply(a:Array[Array[Double]],b:Array[Array[Double]]):Array[Array[Double]]={
val res=Array(Array(0.0, 0.0, 0.0), Array(0.0, 0.0, 0.0), Array(0.0, 0.0, 0.0));
for(i <- 0 to 2){
for(j <- 0 to 2){
for(k <- 0 to 2){
res(i)(j)=(res(i)(j)+(a(i)(k)*b(k)(j))).toDouble;
}
}
}
return res;
}

val newrdd=rdd.map(mat=>("Product is: ",getInv(mat))) //map inverses to same key.
val rdd2=newrdd.reduceByKey(multiply(_,_))            //multiply all inverses in reduce.
rdd2.collect()


