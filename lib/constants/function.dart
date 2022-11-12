


import 'List.dart';
import 'famous_variable.dart';

searchByTitle(String searchFor) {
  try {
    for (int i = 0; i < data.length; i++) {
      if ((data[i]['title']).toString().toLowerCase() == searchFor.toLowerCase()) {
        goBySearch = i;
        countme=i;
        return data[i]['title'];
      }
    }
  } catch (e) {
    print(e);
  }
}
/*
colorMe(){
  Random random = Random();
  int number= random.nextInt(10);
  return colors[number];
}
colorMePlease(int index){
  if(index>9){
    return colors[increaseMe(iAmFromZeroToNine)];
  }
  else{
    int number= 0;
    number=index;
    return colors[number];
  }
}
increaseMe(iAmFromZeroToNine){
  if(iAmFromZeroToNine<9){
    return iAmFromZeroToNine++;
  }
  else{
    iAmFromZeroToNine=0;
    increaseMe(iAmFromZeroToNine);
  }
}*/