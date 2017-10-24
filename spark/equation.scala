// val rdd=sc.textFile("/home/cslab36/Desktop/sparkProg/equation.txt");
val rdd=sc.textFile("equation.txt");


def getEqn(s1:String):String={

val numArr=s1.split(" ");
val x1=numArr(0).toFloat;
val y1=numArr(1).toFloat;
val x2=numArr(2).toFloat;
val y2=numArr(3).toFloat;

val slope=((y2-y1)/(x2-x1)).toFloat;
val intercept=(y1-slope*x1).toFloat;

val eqn="y = "+slope+"x + "+intercept;
return eqn;
}

val rdd1=rdd.map(mat=>(mat,getEqn(mat)))
rdd1.collect()

