-- 데이터베이스 생성 및 선택
CREATE DATABASE IF NOT EXISTS campus_rpg DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE campus_rpg;

-- 1. 유저 테이블 (Users)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(50) UNIQUE NOT NULL COMMENT '학번 또는 이메일 (로그인 ID)',
    password VARCHAR(255) NOT NULL,
    nickname VARCHAR(50) NOT NULL,
    level INT DEFAULT 1,
    exp INT DEFAULT 0,
    coin INT DEFAULT 0,
    title VARCHAR(50) DEFAULT '새내기' COMMENT '현재 칭호',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. 스탯 테이블 (Stats)
CREATE TABLE IF NOT EXISTS stats (
    user_id INT PRIMARY KEY,
    strength INT DEFAULT 0 COMMENT '근력/체력',
    intelligence INT DEFAULT 0 COMMENT '지능/집중력',
    charm INT DEFAULT 0 COMMENT '매력/사교성',
    diligence INT DEFAULT 0 COMMENT '성실함',
    creativity INT DEFAULT 0 COMMENT '창의력',
    laziness INT DEFAULT 0 COMMENT '나태함 (특수 스탯)',
    daily_stat_count INT DEFAULT 0 COMMENT '오늘 올린 스탯 횟수',
    last_stat_update DATE COMMENT '마지막으로 스탯을 올린 날짜 (일일 제한 초기화용)',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 3. 퀘스트/투두 테이블 (Quests)
CREATE TABLE IF NOT EXISTS quests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    type ENUM('DAILY', 'WEEKLY', 'TODO') DEFAULT 'TODO',
    reward_exp INT DEFAULT 0,
    reward_coin INT DEFAULT 0,
    reward_stat_type VARCHAR(20) COMMENT '보상으로 주는 스탯 종류 (예: diligence)',
    reward_stat_amount INT DEFAULT 0,
    is_completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 4. 상점 아이템 테이블 (Items)
CREATE TABLE IF NOT EXISTS items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price INT NOT NULL,
    effect_type VARCHAR(50) COMMENT '효과 종류 (예: EXP_BOOST, STAT_RESET)',
    effect_value INT DEFAULT 0
);
