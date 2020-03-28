class SliderModel{
  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});

   void setImageAssetPath(String getImagepath){
     imagePath= getImagepath;
   }

   void setTitle(String getTitle){
     title= getTitle;
   }

   void  setDesc(String getDesc){
     desc= getDesc;
   }

   String getImagepath(){
     return imagePath;
   }

   String getTitle(){
     return title;
   }

   String getDesc(){
     return desc;
   }

}

List<SliderModel>getSlide(){

  List<SliderModel>slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1


  sliderModel = new SliderModel();
  sliderModel.setTitle("Order");
  sliderModel.setImageAssetPath("assets/hambuger.png");
  sliderModel.setDesc("Discover Restaurant offering the best fast food");
  slides.add(sliderModel);


  sliderModel = new SliderModel();
  sliderModel.setTitle("On the Way");
  sliderModel.setImageAssetPath("assets/ontheway.png");
  sliderModel.setDesc("Discover Restaurant offering the best fast food");
  slides.add(sliderModel);

  sliderModel.setTitle("Search");
  sliderModel.setImageAssetPath("assets/search.png");
  sliderModel.setDesc("Discover Restaurant offering the best fast food");
  slides.add(sliderModel);




  return slides;

}
