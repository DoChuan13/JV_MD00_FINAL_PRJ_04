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
    friendId int primary key auto_increment,
    status   varchar(10) default ('pending')
);

create table if not exists FacebookDatabase.post
(
    postId     int primary key auto_increment,
    content    varchar(500) not null,
    status     varchar(20)  not null,
    postedDate datetime default (now())
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

create table if not exists chat
(
    chatId   int primary key auto_increment,
    content  varchar(500) not null,
    sentDate datetime default (now())
);
create table if not exists userChat
(
    chatId         int not null,
    sentUserId     int not null,
    receivedUserId int not null,
    primary key (chatId, sentUserId, receivedUserId),
    constraint fk_UserChat_ChatId foreign key (chatId) references chat (chatId),
    constraint fk_UserChat_StUserId foreign key (sentUserId) references user (userId),
    constraint fk_UserChat_ReUserId foreign key (receivedUserId) references user (userId)
);

create table if not exists FacebookDatabase.userFriend
(
    friendId       int not null,
    sentUserId     int not null,
    receivedUserId int not null,
    unique (friendId, sentUserId, receivedUserId),
    status         varchar(10) default ('pending'),
    constraint fk_UFriend_FriendId foreign key (friendId) references friend (friendId),
    constraint fk_UFriend_AUserId foreign key (sentUserId) references user (userId),
    constraint fk_UFriend_BUserId foreign key (receivedUserId) references user (userId)
);

# Initial default value
INSERT INTO FacebookDatabase.user (name, userName, email, password)
VALUES ('Admin', 'admin', 'admin@admin.com', 'Admin@123');

insert into FacebookDatabase.role (roleId, roleName)
values (1, 'ADMIN'),
       (2, 'PM'),
       (3, 'USER');

insert into FacebookDatabase.userRole (userId, roleId)
values (1, 1);