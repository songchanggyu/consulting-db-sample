-- 예약 테이블 생성
CREATE TABLE reservations (
    reservation_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),     -- 학생 ID
    professor_id INT REFERENCES professors(professor_id), -- 교수 ID
    timeslot_id INT REFERENCES timeslots(timeslot_id)   -- 시간표 ID
);

-- 예약 데이터 삽입
-- 김철수 → 고성현 교수님 → 금요일 10:00
INSERT INTO reservations (student_id, professor_id, timeslot_id)
VALUES (1, 1, 1);

-- 홍길동 → 고성현 교수님 → 금요일 11:00
INSERT INTO reservations (student_id, professor_id, timeslot_id)
VALUES (2, 1, 2);

-- 예약 확인
SELECT r.reservation_id, s.name AS student, p.name AS professor,
       t.day_of_week, t.start_time, t.end_time
FROM reservations r
JOIN students s ON r.student_id = s.student_id
JOIN professors p ON r.professor_id = p.professor_id
JOIN timeslots t ON r.timeslot_id = t.timeslot_id;
