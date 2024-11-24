import 'package:tourism/model/tourism_type_model.dart';

List<TourismTypeModel> tourismTypes = [
  TourismTypeModel(
    image: "assets/images/adv.jpeg",
    name: "Adventure",
    description: "Explore thrilling and exciting adventure tourism experiences, including hiking, rafting, and more!",
    activities: [
      "Hiking in rugged terrains",
      "Whitewater rafting",
      "Rock climbing",
      "Zip lining"
    ],
    locations: [
      "Grand Canyon, USA",
      "Zion National Park, USA",
      "Kilimanjaro, Tanzania"
    ],
  ),
  TourismTypeModel(
    image: "assets/images/snow.jpg",
    name: "Snow",
    description: "Experience winter wonderlands, snow sports, and cold adventures at the most breathtaking snowy destinations.",
    activities: [
      "Skiing",
      "Snowboarding",
      "Ice fishing",
      "Snow hiking"
    ],
    locations: [
      "Swiss Alps, Switzerland",
      "Whistler, Canada",
      "Aspen, USA"
    ],
  ),
  TourismTypeModel(
    image: "assets/images/mount.jpg",
    name: "Mountain",
    description: "Conquer the highest peaks and explore mountain landscapes, perfect for trekking, mountaineering, and camping.",
    activities: [
      "Mountain climbing",
      "Trekking",
      "Camping in high altitudes",
      "Scenic photography"
    ],
    locations: [
      "Mount Everest, Nepal",
      "Mount Fuji, Japan",
      "K2, Pakistan/China"
    ],
  ),
  TourismTypeModel(
    image: "assets/images/religion.jpeg",
    name: "Religion",
    description: "Visit sacred and religious sites that offer cultural and spiritual experiences.",
    activities: [
      "Pilgrimages",
      "Religious tours",
      "Spiritual retreats"
    ],
    locations: [
      "Vatican City, Italy",
      "Mecca, Saudi Arabia",
      "Varanasi, India"
    ],
  ),
  TourismTypeModel(
    image: "assets/images/fishing.jpeg",
    name: "Fishing",
    description: "Enjoy serene lakes, rivers, and seas for a peaceful fishing experience amidst nature.",
    activities: [
      "Fly fishing",
      "Deep-sea fishing",
      "Lake fishing",
      "Ice fishing"
    ],
    locations: [
      "Lake Baikal, Russia",
      "The Maldives",
      "New Zealand"
    ],
  ),
];
