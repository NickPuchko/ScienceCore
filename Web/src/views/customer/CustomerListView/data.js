import { v4 as uuid } from 'uuid';

export default [
  {
    id: uuid(),
    status:'Доцент',
    avatarUrl: '/static/images/avatars/avatar_3.png',
    email: 'lev1950@gmail.com',
    name: 'Лев Львович',
    faculty: 'МиП',
    projects: 12
  },
  {
    id: uuid(),
    status:'Доцент',
    avatarUrl: '/static/images/avatars/avatar_3.png',
    email: 'lev1950@gmail.com',
    name: 'Лев Петрович',
    faculty: 'ФЭиФ',
    projects: 16
  },
  {
    id: uuid(),
    status:'Доцент',
    avatarUrl: '/static/images/avatars/avatar_3.png',
    email: 'lev1953@gmail.com',
    name: 'Лев Валерьевич',
    faculty: 'ТД',
    projects: 13
  },
  {
    id: uuid(),
    status:'Доцент',
    avatarUrl: '/static/images/avatars/avatar_3.png',
    email: 'lev1954@gmail.com',
    name: 'Лев Евгеньевич',
    faculty: 'МиП',
    projects: 12
  },
  {
    id: uuid(),
    address: {
      country: 'USA',
      state: 'Texas',
      city: 'Dallas',
      street: '75247'
    },
    avatarUrl: '/static/images/avatars/avatar_6.png',
    createdAt: 1554757200000,
    email: 'clarke.gillebert@devias.io',
    name: 'Clarke Gillebert',
    phone: '972-333-4106'
  },
  {
    id: uuid(),
    address: {
      country: 'USA',
      state: 'California',
      city: 'Bakerfield',
      street: '317 Angus Road'
    },
    avatarUrl: '/static/images/avatars/avatar_1.png',
    createdAt: 1554670800000,
    email: 'adam.denisov@devias.io',
    name: 'Adam Denisov',
    phone: '858-602-3409'
  },
  {
    id: uuid(),
    address: {
      country: 'USA',
      state: 'California',
      city: 'Redondo Beach',
      street: '2188  Armbrester Drive'
    },
    avatarUrl: '/static/images/avatars/avatar_7.png',
    createdAt: 1554325200000,
    email: 'ava.gregoraci@devias.io',
    name: 'Ava Gregoraci',
    phone: '415-907-2647'
  },
  {
    id: uuid(),
    address: {
      country: 'USA',
      state: 'Nevada',
      city: 'Las Vegas',
      street: '1798  Hickory Ridge Drive'
    },
    avatarUrl: '/static/images/avatars/avatar_8.png',
    createdAt: 1523048400000,
    email: 'emilee.simchenko@devias.io',
    name: 'Emilee Simchenko',
    phone: '702-661-1654'
  },
  {
    id: uuid(),
    address: {
      country: 'USA',
      state: 'Michigan',
      city: 'Detroit',
      street: '3934  Wildrose Lane'
    },
    avatarUrl: '/static/images/avatars/avatar_9.png',
    createdAt: 1554702800000,
    email: 'kwak.seong.min@devias.io',
    name: 'Kwak Seong-Min',
    phone: '313-812-8947'
  },
  {
    id: uuid(),
    address: {
      country: 'USA',
      state: 'Utah',
      city: 'Salt Lake City',
      street: '368 Lamberts Branch Road'
    },
    avatarUrl: '/static/images/avatars/avatar_10.png',
    createdAt: 1522702800000,
    email: 'merrile.burgett@devias.io',
    name: 'Merrile Burgett',
    phone: '801-301-7894'
  }
];
