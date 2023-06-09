create database if not exists FacebookDatabase;

use FacebookDatabase;

create table if not exists FacebookDatabase.user
(
    userId          int primary key auto_increment,
    name            varchar(255) not null,
    userName        varchar(255) not null unique,
    email           varchar(255) not null unique,
    password        varchar(255) not null,
    avatar          varchar(255),
    createdDate     datetime default (now()),
    updatedUserName datetime default (now()),
    updatedEmail    datetime default (now()),
    status          bit      default (0)
);

create table if not exists FacebookDatabase.role
(
    roleId   int primary key,
    roleName varchar(255) not null
);

create table if not exists FacebookDatabase.friend
(
    friendId   int primary key auto_increment,
    friendDate datetime    default (now()),
    status     varchar(10) default ('pending')
);

create table if not exists FacebookDatabase.post
(
    postId     int primary key auto_increment,
    content    varchar(500) not null,
    status     varchar(20)  not null,
    postedDate datetime default (now())
);

create table if not exists FacebookDatabase.image
(
    imageId  int primary key auto_increment,
    imageSrc varchar(500) not null
);

create table if not exists FacebookDatabase.comment
(
    commentId     int primary key auto_increment,
    content       varchar(500) not null,
    commentedDate datetime default (now())
);

create table if not exists FacebookDatabase.like
(
    likeId    int primary key auto_increment,
    likedDate datetime default (now())
);

create table if not exists FacebookDatabase.userRole
(
    userId int not null,
    roleId int not null,
    primary key (userId, roleId),
    constraint fk_UserRole_UserId foreign key (userId) references user (userId),
    constraint fk_UserRole_RoleId foreign key (roleId) references role (roleId)
);

create table if not exists FacebookDatabase.userPost
(
    postId int not null,
    userId int not null,
    unique (postId, userId),
    constraint fk_UserPost_PostId foreign key (postId) references post (postId),
    constraint fk_UserPost_UserId foreign key (userId) references user (userId)
);

create table if not exists commentPost
(
    commentId int not null,
    postId    int not null,
    userId    int not null,
    primary key (commentId, postId, userId),
    constraint fk_CommentPost_CommentId foreign key (commentId) references comment (commentId),
    constraint fk_CommentPost_PostId foreign key (postId) references post (postId),
    constraint fk_CommentPost_UserId foreign key (userId) references user (userId)
);

create table if not exists likePost
(
    likeId int not null,
    postId int not null,
    userId int not null,
    primary key (likeId, postId, userId),
    constraint fk_LikePost_LikeId foreign key (likeId) references `like` (likeId),
    constraint fk_LikePost_PostId foreign key (postId) references post (postId),
    constraint fk_LikePost_UserId foreign key (userId) references user (userId)
);

create table if not exists FacebookDatabase.imagePost
(
    imageId int not null,
    postId  int not null,
    primary key (imageId, postId),
    constraint fk_ImagePost_ImageId foreign key (imageId) references image (imageId),
    constraint fk_ImagePost_PostId foreign key (postId) references post (postId)
);

create table if not exists FacebookDatabase.userChat
(
    chatId         int auto_increment,
    sentUserId     int ,
    receivedUserId int ,
    startTime      datetime default (now()),
    latestTime     datetime default (now()),
    sentUserIn     datetime default (now()),
    receivedUserIn datetime default (now()),
    primary key (chatId, sentUserId, receivedUserId),
    constraint fk_UserChat_StUserId foreign key (sentUserId) references user (userId),
    constraint fk_UserChat_ReUserId foreign key (receivedUserId) references user (userId)
);

create table if not exists FacebookDatabase.chat
(
    chatDetailId int primary key auto_increment,
    chatId       int          not null,
    content      varchar(500) not null,
    sentDate     datetime default (now()),
    sentUserId   int          not null,
    constraint fk_Chat_ChatId foreign key (chatId) references userChat (chatId),
    constraint fk_Chat_UserId foreign key (sentUserId) references user (userId)
);

create table if not exists FacebookDatabase.userFriend
(
    friendId       int not null,
    sentUserId     int not null,
    receivedUserId int not null,
    unique (friendId, sentUserId, receivedUserId),
    constraint fk_UFriend_FriendId foreign key (friendId) references friend (friendId),
    constraint fk_UFriend_AUserId foreign key (sentUserId) references user (userId),
    constraint fk_UFriend_BUserId foreign key (receivedUserId) references user (userId)
);

# Initial default value
insert into FacebookDatabase.role (roleId, roleName)
values (1, 'ADMIN'),
       (2, 'PM'),
       (3, 'USER');
INSERT INTO FacebookDatabase.user (name, userName, email, password, avatar)
VALUES ('Admin', 'admin', 'admin@admin.com', 'Admin@123',
        'https://firebasestorage.googleapis.com/v0/b/java-full-stack-76e1c.appspot.com/o/avatar.jpeg?alt=media&token=0dd6e72d-fcaf-4565-beec-76c89347767c');


INSERT INTO FacebookDatabase.user (name, userName, email, password, avatar, createdDate, updatedUserName, updatedEmail,
                                   status)
VALUES ('Van', 'van', 'van@gmail.com', 'Van@123',
        'https://firebasestorage.googleapis.com/v0/b/java-full-stack-76e1c.appspot.com/o/avatar.jpeg?alt=media&token=0dd6e72d-fcaf-4565-beec-76c89347767c',
        DEFAULT, DEFAULT, DEFAULT, DEFAULT),
       ('Son', 'son', 'son@gmail.com', 'Son@123',
        'https://firebasestorage.googleapis.com/v0/b/java-full-stack-76e1c.appspot.com/o/avatar.jpeg?alt=media&token=0dd6e72d-fcaf-4565-beec-76c89347767c',
        DEFAULT, DEFAULT, DEFAULT, DEFAULT),
       ('Huy', 'huy', 'huy@gmail.com', 'Huy@123',
        'https://firebasestorage.googleapis.com/v0/b/java-full-stack-76e1c.appspot.com/o/avatar.jpeg?alt=media&token=0dd6e72d-fcaf-4565-beec-76c89347767c',
        DEFAULT, DEFAULT, DEFAULT, DEFAULT),
       ('Ha', 'ha', 'ha@gmail.com', 'Ha@123',
        'https://firebasestorage.googleapis.com/v0/b/java-full-stack-76e1c.appspot.com/o/avatar.jpeg?alt=media&token=0dd6e72d-fcaf-4565-beec-76c89347767c',
        DEFAULT, DEFAULT, DEFAULT, DEFAULT),
       ('Chuan', 'chuan', 'chuan@gmail.com', 'Chuan@123',
        'https://firebasestorage.googleapis.com/v0/b/java-full-stack-76e1c.appspot.com/o/avatar.jpeg?alt=media&token=0dd6e72d-fcaf-4565-beec-76c89347767c',
        DEFAULT, DEFAULT, DEFAULT, DEFAULT),
       ('Vuong', 'vuong', 'vuong@gmail.com', 'Vuong@123',
        'https://firebasestorage.googleapis.com/v0/b/java-full-stack-76e1c.appspot.com/o/avatar.jpeg?alt=media&token=0dd6e72d-fcaf-4565-beec-76c89347767c',
        DEFAULT, DEFAULT, DEFAULT, DEFAULT),
       ('Dat', 'dat', 'dat@gmail.com', 'Dat@123',
        'https://firebasestorage.googleapis.com/v0/b/java-full-stack-76e1c.appspot.com/o/avatar.jpeg?alt=media&token=0dd6e72d-fcaf-4565-beec-76c89347767c',
        DEFAULT, DEFAULT, DEFAULT, DEFAULT),
       ('Thu', 'thu', 'thu@gmail.com', 'Thu@123',
        'https://firebasestorage.googleapis.com/v0/b/java-full-stack-76e1c.appspot.com/o/avatar.jpeg?alt=media&token=0dd6e72d-fcaf-4565-beec-76c89347767c',
        DEFAULT, DEFAULT, DEFAULT, DEFAULT),
       ('Minh', 'minh', 'minh@gmail.com', 'Minh@123',
        'https://firebasestorage.googleapis.com/v0/b/java-full-stack-76e1c.appspot.com/o/avatar.jpeg?alt=media&token=0dd6e72d-fcaf-4565-beec-76c89347767c',
        DEFAULT, DEFAULT, DEFAULT, DEFAULT),
       ('Yen', 'yen', 'yen@gmail.com', 'Yen@123',
        'https://firebasestorage.googleapis.com/v0/b/java-full-stack-76e1c.appspot.com/o/avatar.jpeg?alt=media&token=0dd6e72d-fcaf-4565-beec-76c89347767c',
        DEFAULT, DEFAULT, DEFAULT, DEFAULT),
       ('Chinh', 'chinh', 'chinh@gmail.com', 'Chinh@123',
        'https://firebasestorage.googleapis.com/v0/b/java-full-stack-76e1c.appspot.com/o/avatar.jpeg?alt=media&token=0dd6e72d-fcaf-4565-beec-76c89347767c',
        DEFAULT, DEFAULT, DEFAULT, DEFAULT);


insert into FacebookDatabase.userRole (userId, roleId)
values (1, 1),
       (2, 2),
       (3, 3),
       (4, 3),
       (5, 3),
       (6, 3),
       (7, 3),
       (8, 3),
       (9, 3),
       (10, 3),
       (11, 3),
       (12, 2);
