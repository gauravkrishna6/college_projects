val rdd =sc.parallelize(1 to 100)

def getValues(num:Int):String={
val z=num;
val y=num;
val x=((10-(z*z*y*y)/(z+Math.sin(y)))).toFloat;

val result="x = "+x+" y = "+y+" z = "+z;
return result;
}


val newRdd=rdd.map(num=>getValues(num))
newRdd.foreach(strn=>println(strn));

