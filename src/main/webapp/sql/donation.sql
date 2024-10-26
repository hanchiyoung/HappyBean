-- 기부 기록 테이블
-- donation_num (Primary Key) : 기부 기록 고유 넘버
-- campaign_num (Foreign Key) : 캠페인 넘버 (참조: CampaignsTBL)
-- user_id (Foreign Key) : 사용자 ID (참조: UserTBL)
-- amount : 기부 금액
-- donation_date : 기부 날짜
DROP TABLE IF EXISTS DonationsTBL;
CREATE TABLE DonationsTBL (
    donation_num INT AUTO_INCREMENT PRIMARY KEY,
    campaign_num INT NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    amount INT NOT NULL,
    donation_date DATE NOT NULL,
    donation_type ENUM('donation', 'funding') NOT NULL
);

SELECT COUNT(DISTINCT user_id) as totalUser, sum(amount) as totalAmount FROM donationstbl where donation_type = "donation";

select * from fundingtbl;

insert into donationstbl (campaign_num, user_id, amount, donation_date, donation_type)
	values (1, "user1", 1500000, now(), "후원");
select * from DonationsTBL;
SELECT COUNT(DISTINCT user_id) FROM donationstbl where donation_date = "2024-09-28";

select sum(amount) from donationstbl where campaign_num = 1 and donation_type = "후원";

select sum(amount) from donationstbl where user_id = "user1" and donation_type = "후원";
