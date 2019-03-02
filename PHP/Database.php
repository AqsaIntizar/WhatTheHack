<?php

class Database {
    private static $instance = null;

    private $db;

    private function __construct()
    {
        try
        {
            $config = Config::getConfigInstantie();
            $server = $config->getServer();
            $database = $config->getDatabase();
            $username = $config->getUsername();
            $password = $config->getPassword();

            $this->db = new PDO("mysql:host=$server; dbname=$database; charset=utf8mb4",
                $username,
                $password,
                array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
        }
        catch (PDOException $e)
        {
            die($e->getMessage());
            //of
            //exit($e->getMessage());
        }
    }

    public static function getInstance()
    {
        if(is_null(self::$instance))
        {
            self::$instance = new Database();
        }
        return self::$instance;
    }

    public function closeDB()
    {
        self::$instance = null;
    }

    public function getFeed()
    {
        try
        {
            $sql = "select startup.*, concat(usr.FirstName, ' ', usr.LastName) as fullName from startup join usr on usr.uid = startup.Owner_ID";
            $stmt = $this->db->prepare($sql);
            $stmt->execute();
            $feedTable = $stmt->fetchAll(PDO::FETCH_OBJ);
        }
        catch (PDOException $e)
        {
            die($e->getMessage());
        }

        return $feedTable;
    }

    public function getFeedByTimeFilter($maxDiff) {
        try
        {
            $sql = "select startup.*, concat(usr.FirstName, ' ', usr.LastName) as fullName, DATEDIFF(now(), startup.Join_Date) 
                        from startup 
                        join usr on usr.uid = startup.Owner_ID
                        where DATEDIFF(now(), startup.Join_Date) < :df
                        order by Join_Date DESC;";

            $stmt = $this->db->prepare($sql);
            $stmt->bindParam(":df", $maxDiff);
            $stmt->execute();
            $feedTable = $stmt->fetchAll(PDO::FETCH_OBJ);
        }
        catch (PDOException $e)
        {
            die($e->getMessage());
        }

        if(empty($feedTable))
        {
            die("No feed to show.");
        }
        return $feedTable;
    }

    public function getUser($email, $password) {
        try
        {
            $sql = "select * from usr where Email = :email and PW = :pwd";
            $stmt = $this->db->prepare($sql);
            $stmt->bindParam(":email", $email);
            $stmt->bindParam(":pwd", $password);
            $stmt->execute();
            $user = $stmt->fetch(PDO::FETCH_OBJ);
        }
        catch (PDOException $e)
        {
            die($e->getMessage());
        }

        return $user;
    }

//    public function isValidUser($username, $password) {
//        $isValid = false;
//        $conn = new mysqli($this->serverName, $this->username, $this->password, $this->dbName);
//
//        $username = htmlspecialchars($username);
//        $password = htmlspecialchars($password);
//
//        $sql = "SELECT COUNT(*) AS occurrence FROM users WHERE BINARY usr = \"$username\" AND pwd = \"$password\"";
//        $result = $conn->query($sql);
//
//        if ($result->fetch_assoc()["occurrence"] > 0) {
//            $isValid = true;
//        }
//
//        $conn->close();
//
//        return $isValid;
//    }
//
//    public function findUser($username) {
//        $conn = new mysqli($this->serverName, $this->username, $this->password, $this->dbName);
//        $succeeded = false;
//
//        $username = htmlspecialchars($username);
//
//        $sql = "SELECT COUNT(*) AS occurrence FROM users WHERE usr = \"$username\"";
//        $result = $conn->query($sql);
//
//        if ($result->fetch_assoc()["occurrence"] > 0) {
//            $succeeded = true;
//        }
//
//        $conn->close();
//
//        return $succeeded;
//    }
//
//    public function addUser($username, $password, $mail) {
//        $conn = new mysqli($this->serverName, $this->username, $this->password, $this->dbName);
//
//        $username = htmlspecialchars($username);
//        $password = htmlspecialchars($password);
//        $mail = htmlspecialchars($mail);
//
//        $sql = "INSERT INTO users (usr, pwd, email, regTime) VALUES (\"$username\", \"$password\", \"$mail\", CURRENT_TIME)";
//        $result = false;
//
//        if ($conn->query($sql) === TRUE) {
//            $result = true;
//        }
//
//        $conn->close();
//
//        return $result;
//    }
//
//    public function getUserId($username) {
//        $conn = new mysqli($this->serverName, $this->username, $this->password, $this->dbName);
//
//        $username = htmlspecialchars($username);
//
//        $sql = "SELECT id FROM users WHERE usr = \"$username\"";
//        $result = $conn->query($sql);
//
//        $id = $result->fetch_assoc()["id"];
//
//        $conn->close();
//
//        return $id;
//    }
//
//    public function addChat($chatname, $userId) {
//        $conn = new mysqli($this->serverName, $this->username, $this->password, $this->dbName);
//
//        $chatname = htmlspecialchars($chatname);
//
//        $sql = "INSERT INTO chats (chatName, creatorId, creationTime) VALUES (\"$chatname\", \"$userId\", CURRENT_TIME)";
//        $result = false;
//
//        if ($conn->query($sql) === TRUE) {
//            $chatId = $conn->insert_id;
//
//            $result = $this->addMember($chatId, $userId);
//        }
//
//        $conn->close();
//
//        return $result;
//    }
//
//    public function addMember($chatId, $userId) {
//        $conn = new mysqli($this->serverName, $this->username, $this->password, $this->dbName);
//
//        $chatId = htmlspecialchars($chatId);
//        $userId = htmlspecialchars($userId);
//
//        $sql = "INSERT INTO members (chatId, userId) VALUES (\"$chatId\", \"$userId\")";
//        $result = false;
//
//        if ($conn->query($sql) === TRUE) {
//            $result = true;
//        }
//
//        $conn->close();
//
//        return $result;
//    }
//
//    public function getUsernamesLike($value) {
//        $conn = new mysqli($this->serverName, $this->username, $this->password, $this->dbName);
//
//        $value = htmlspecialchars($value);
//
//        $sql = "SELECT usr FROM users WHERE usr LIKE \"$value%\"";
//        $result = $conn->query($sql);
//
//        $users = [];
//
//        while($user = $result->fetch_assoc()["usr"]) {
//            array_push($users, $user);
//        }
//
//        $conn->close();
//
//        return $users;
//    }
//
//    public function getChatsForUser($userId) {
//        $conn = new mysqli($this->serverName, $this->username, $this->password, $this->dbName);
//
//        $userId = htmlspecialchars($userId);
//
//        $sql = "SELECT id, chatName FROM chats JOIN members ON chats.id = members.chatId WHERE members.userId = \"$userId\"";
//        $result = $conn->query($sql);
//
//        $chats = [];
//
//        while($chat = $result->fetch_assoc()) {
//            array_push($chats, $chat);
//        }
//
//        $conn->close();
//
//        return $chats;
//    }
//
//    public function getChatMembers($chatId) {
//        $conn = new mysqli($this->serverName, $this->username, $this->password, $this->dbName);
//
//        $chatId = htmlspecialchars($chatId);
//
//        $sql = "SELECT id, usr FROM users JOIN members ON users.id = members.userId WHERE members.chatId = \"$chatId\"";
//        $result = $conn->query($sql);
//
//        $members = [];
//
//        while($member = $result->fetch_assoc()) {
//            array_push($members, $member);
//        }
//
//        $conn->close();
//
//        return $members;
//    }
//
//    public function isMemberOfChat($chatId, $userId) {
//        $isValid = false;
//        $conn = new mysqli($this->serverName, $this->username, $this->password, $this->dbName);
//
//        $chatId = htmlspecialchars($chatId);
//        $userId = htmlspecialchars($userId);
//
//        $sql = "SELECT COUNT(*) AS occurrence FROM members WHERE chatId = \"$chatId\" AND userId = \"$userId\"";
//        $result = $conn->query($sql);
//
//        if ($result->fetch_assoc()["occurrence"] > 0) {
//            $isValid = true;
//        }
//
//        $conn->close();
//
//        return $isValid;
//    }
//
//    public function getMessages($chatId, $userId, $beginIndex, $amount) {
//        $conn = new mysqli($this->serverName, $this->username, $this->password, $this->dbName);
//
//        $chatId = htmlspecialchars($chatId);
//        $userId = htmlspecialchars($userId);
//        $beginIndex = htmlspecialchars($beginIndex);
//        $amount = htmlspecialchars($amount);
//
//        $sql = "SELECT messages.senderId = \"$userId\" AS isSender, users.usr, messages.content, messages.sendTime FROM messages JOIN chats ON messages.chatId = chats.id JOIN users ON users.id = messages.senderId WHERE messages.chatId = \"$chatId\" ORDER BY sendTime DESC LIMIT $beginIndex, $amount";
//        $result = $conn->query($sql);
//
//        $messages = [];
//
//        while($message = $result->fetch_assoc()) {
//            array_push($messages, $message);
//        }
//
//        $conn->close();
//
//        return $messages;
//    }
//
//    public function sendMessage($chatId, $usrId, $message) {
//        $conn = new mysqli($this->serverName, $this->username, $this->password, $this->dbName);
//
//        $chatId = htmlspecialchars($chatId);
//        $usrId = htmlspecialchars($usrId);
//        $message = htmlspecialchars($message);
//
//        $sql = "INSERT INTO messages (chatId, senderId, content, sendTime) VALUES (\"$chatId\", \"$usrId\", \"$message\", CURRENT_TIME)";
//        $result = false;
//
//        if ($conn->query($sql) === TRUE) {
//            $result = true;
//        }
//
//        $conn->close();
//
//        return $result;
//    }
}



// users        : (id, usr, pwd, email, regDate)
// chats        : (id, chatName, creatorId, creationDate)
// members      : (chatId, userId)
// messages     : (id, chatId, senderId, content, sendDate)
// reads        : (messageId, userId)

/*
    CREATE TABLE users (
        id INT(6) AUTO_INCREMENT NOT NULL,
        usr VARCHAR(30) NOT NULL,
        pwd VARCHAR(50) NOT NULL,
        email VARCHAR(50),
        regTime TIMESTAMP,
        CONSTRAINT pk_users PRIMARY KEY(id)
    ) ENGINE = INNODB;

    CREATE TABLE chats (
        id INT(6) AUTO_INCREMENT NOT NULL,
        chatName VARCHAR(30) NOT NULL,
        creatorId INT(6) NOT NULL,
        creationTime TIMESTAMP,
        CONSTRAINT pk_chats PRIMARY KEY(id),
        CONSTRAINT fk_chats FOREIGN KEY(creatorId) REFERENCES users(id)
    ) ENGINE = INNODB;

    CREATE TABLE members (
        chatId INT(6) NOT NULL,
        userId INT(6) NOT NULL,
        CONSTRAINT pk_members PRIMARY KEY(chatId, userId),
        CONSTRAINT fk1_members FOREIGN KEY(chatId) REFERENCES chats(id),
        CONSTRAINT fk2_members FOREIGN KEY(userId) REFERENCES users(id)
    ) ENGINE = INNODB;

    CREATE TABLE messages (
        id INT(6) AUTO_INCREMENT NOT NULL,
        chatId INT(6) NOT NULL,
        senderId INT(6) NOT NULL,
        content VARCHAR(100),
        sendTime TIMESTAMP,
        CONSTRAINT pk_messages PRIMARY KEY(id),
        CONSTRAINT fk1_messages FOREIGN KEY(chatId) REFERENCES chats(id),
        CONSTRAINT fk2_messages FOREIGN KEY(senderId) REFERENCES users(id)
    ) ENGINE = INNODB;

    CREATE TABLE messageReads (
        messageId INT(6) NOT NULL,
        userId INT(6) NOT NULL,
        CONSTRAINT pk_messageReads PRIMARY KEY(messageId, userId),
        CONSTRAINT fk1_messageReads FOREIGN KEY(messageId) REFERENCES messages(id),
        CONSTRAINT fk2_messageReads FOREIGN KEY(userId) REFERENCES users(id)
    ) ENGINE = INNODB;


 */