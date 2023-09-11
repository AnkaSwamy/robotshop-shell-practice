

echo -e "\e[31m Installing Nginx server \e[0m "
yum install nginx -y &>>$log_file


echo -e "\e[31m Remove default content \e[0m"
rm -rf /usr/share/nginx/html/* &>>$log_file
mkdir /app


echo -e "\e[31m Download frontend content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip  &>>$log_file


echo -e "\e[31m Extract frontend content \e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>$log_file


echo -e "\e[31m Update the configuration \e[0m"
cp /root/robotshop-shell-practice/roboshop.conf /etc/nginx/default.d/roboshop.conf  &>>$log_file


echo -e "\e[31m Start nginx server \e[0m"
systemctl enable nginx &>>$log_file
systemctl restart nginx  &>>$log_file
