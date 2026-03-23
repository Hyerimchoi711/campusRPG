USE campus_rpg;

-- 기본 상점 아이템 데이터 추가
INSERT INTO items (name, description, price, effect_type, effect_value) VALUES 
('경험치 부스터', '1시간 동안 획득 경험치 2배', 500, 'EXP_BOOST', 2),
('스탯 초기화권', '모든 스탯을 0으로 되돌립니다', 1000, 'STAT_RESET', 0),
('에너지 드링크', '즉시 체력 스탯 +5', 300, 'STAT_BOOST_STRENGTH', 5),
('전공 서적 요약본', '즉시 집중력 스탯 +5', 300, 'STAT_BOOST_INTELLIGENCE', 5);

-- 테스트용 더미 유저 추가 (비밀번호는 평문으로 넣지만 실제로는 해싱해야 함)
INSERT INTO users (student_id, password, nickname, level, exp, coin) VALUES 
('20260001', '1234', '김대학', 7, 1240, 240);

-- 테스트 유저의 스탯 추가
INSERT INTO stats (user_id, strength, intelligence, charm, diligence, creativity, laziness) VALUES 
(1, 45, 80, 55, 72, 63, 28);

-- 테스트 유저의 퀘스트 추가
INSERT INTO quests (user_id, title, type, reward_exp, reward_coin, reward_stat_type, reward_stat_amount, is_completed) VALUES 
(1, '아침 9시 전 기상', 'DAILY', 50, 10, 'diligence', 1, TRUE),
(1, '강의 출석 완료', 'DAILY', 80, 20, 'diligence', 2, TRUE),
(1, '도서관 2시간 공부', 'DAILY', 120, 30, 'intelligence', 2, TRUE),
(1, '과제 제출하기', 'TODO', 150, 50, 'diligence', 3, FALSE),
(1, '동아리 활동 참여', 'TODO', 100, 30, 'charm', 2, FALSE);
