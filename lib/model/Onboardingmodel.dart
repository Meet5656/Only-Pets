class Onboardingmodel {
  final String title;
  final String image;
  final String description;

  Onboardingmodel({
    required this.title,
    required this.image,
    required this.description,
  });
}

List<Onboardingmodel> contents = [
  Onboardingmodel(
      image:
          'asset/all pets/160644791168cc41be2d8e6713d1a42fe57dcdbbb9_thumbnail_720x.jpg',
      title: 'Welcome to our app ',
      description: 'With our app you make life of our\n funny friends happier'),
  Onboardingmodel(
      image: 'asset/all pets/karsten-winegeart-Y0nU6dqDCbY-unsplash.jpg',
      title: 'Social for your pet',
      description:
          'Pawsitively together pet owners and \n animal lovers from all over the country!'),
  Onboardingmodel(
      image: 'asset/all pets/karsten-winegeart-YzxeHEzBZ6I-unsplash.jpg',
      title: 'Find and buy attractive items',
      description:
          'Will help you order the needed \n items as soon as you are at home')
];
