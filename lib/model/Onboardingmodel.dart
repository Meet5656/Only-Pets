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
      image: 'asset/all pets/160644791168cc41be2d8e6713d1a42fe57dcdbbb9_thumbnail_720x.jpg',
      title: 'Convenient use',
      description: 'Everything for comfortable\nreading  of favorite\nbooks'),
  Onboardingmodel(
      image: 'asset/all pets/karsten-winegeart-Y0nU6dqDCbY-unsplash.jpg',
      title: 'Online listening',
      description:
          'Different formats for listening\nto books with labels and\nsubtitles'),
  Onboardingmodel(
      image: 'asset/all pets/karsten-winegeart-YzxeHEzBZ6I-unsplash.jpg',
      title: 'Search',
      description:
          'Easy search by all\ncategories and authors from\nall over the world')
];
