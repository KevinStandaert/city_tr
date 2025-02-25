import 'package:city_tr/models/trip_model.dart';

import '../models/activity_model.dart';
import '../models/city_model.dart';

List<City> cities = [
  City(
    name: 'Paris',
    image: 'assets/images/paris.webp',
    activities: [
      Activity(
          image: 'assets/images/activities/louvre.webp',
          name: 'Le Louvre',
          id: 'a1',
          city: 'Paris',
          price: 25.00),
      Activity(
          image: 'assets/images/activities/chaumont.webp',
          name: 'Les buttes Chaumont',
          id: 'a2',
          city: 'Paris',
          price: 00.00),
      Activity(
          image: 'assets/images/activities/dame.webp',
          name: 'Notre Dame',
          id: 'a3',
          city: 'Paris',
          price: 35.00),
      Activity(
          image: 'assets/images/activities/defense.webp',
          name: 'La Défense',
          id: 'a4',
          city: 'Paris',
          price: 10.00),
      Activity(
          image: 'assets/images/activities/moulin.webp',
          name: 'Le moulin rouge',
          id: 'a5',
          city: 'Paris',
          price: 50.00),
      Activity(
          image: 'assets/images/activities/versaille.webp',
          name: 'La chateau de Versailles',
          id: 'a6',
          city: 'Paris',
          price: 30.00),
    ],
  ),
  City(
    name: 'Lyon',
    image: 'assets/images/lyon.webp',
    activities: [
      Activity(
          image: 'assets/images/activities/bellecour.webp',
          name: 'Le place Bellecour',
          id: 'l1',
          city: 'Lyon',
          price: 00.00),
      Activity(
          image: 'assets/images/activities/confluences.webp',
          name: 'Musée Confluences',
          id: 'l2',
          city: 'Lyon',
          price: 22.00),
      Activity(
          image: 'assets/images/activities/fourviere.webp',
          name: 'Le mont Fourvière',
          id: 'l3',
          city: 'Lyon',
          price: 10.00),
      Activity(
          image: 'assets/images/activities/halles_lyon.webp',
          name: 'Les halles de lyon',
          id: 'l4',
          city: 'Lyon',
          price: 45.00),
      Activity(
          image: 'assets/images/activities/parc_tete_or.webp',
          name: 'Le parc de la tête d\'or',
          id: 'l5',
          city: 'Lyon',
          price: 14.00),
      Activity(
          image: 'assets/images/activities/vieux_lyon.webp',
          name: 'Le vieux Lyon',
          id: 'l6',
          city: 'Lyon',
          price: 30.00),
    ],
  ),
  City(
    name: 'Nice',
    image: 'assets/images/nice.webp',
    activities: [
      Activity(
          image: 'assets/images/activities/colline_chateau.webp',
          name: 'La colline du château',
          id: 'n1',
          city: 'Nice',
          price: 05.00),
      Activity(
          image: 'assets/images/activities/marche_fleurs.webp',
          name: 'Le marché aux fleurs',
          id: 'n2',
          city: 'Nice',
          price: 00.00),
      Activity(
          image: 'assets/images/activities/musee_art_moderne.webp',
          name: 'Le musée d\'art moderne',
          id: 'n3',
          city: 'Nice',
          price: 12.00),
      Activity(
          image: 'assets/images/activities/parc_phoenix.webp',
          name: 'Le parc Phoenix',
          id: 'n4',
          city: 'Nice',
          price: 10.00),
      Activity(
          image: 'assets/images/activities/place_massena.webp',
          name: 'La place Masséna',
          id: 'n5',
          city: 'Nice',
          price: 00.00),
      Activity(
          image: 'assets/images/activities/promenade_anglais.webp',
          name: 'La promenade des anglais',
          id: 'n6',
          city: 'Nice',
          price: 00.00),
      Activity(
          image: 'assets/images/activities/plage_nice.webp',
          name: 'La plage de Nice',
          id: 'n7',
          city: 'Nice',
          price: 28.00),
    ],
  ),
];

List<Trip> trips = [
  Trip(
    activities: [
      Activity(
          image: 'assets/images/activities/louvre.webp',
          name: 'Le Louvre',
          id: 'a1',
          city: 'Paris',
          price: 25.00),
      Activity(
          image: 'assets/images/activities/chaumont.webp',
          name: 'Les buttes Chaumont',
          id: 'a2',
          city: 'Paris',
          price: 00.00),
      Activity(
          image: 'assets/images/activities/dame.webp',
          name: 'Notre Dame',
          id: 'a3',
          city: 'Paris',
          price: 35.00),
      Activity(
          image: 'assets/images/activities/defense.webp',
          name: 'La Défense',
          id: 'a4',
          city: 'Paris',
          price: 10.00),
      Activity(
          image: 'assets/images/activities/moulin.webp',
          name: 'Le moulin rouge',
          id: 'a5',
          city: 'Paris',
          price: 50.00),
    ],
    city: 'Paris',
    date: DateTime.now().add(const Duration(days: 1)),
  ),
  Trip(
      activities: [],
      city: 'Lyon',
      date: DateTime.now().add(const Duration(days: 2))),
  Trip(
      activities: [],
      city: 'Nice',
      date: DateTime.now().subtract(const Duration(days: 1))),
];
