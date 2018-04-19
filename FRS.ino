
int ain[3];
void setup() {
  Serial.begin(9600);  // シリアル通信速度
}

void loop() {
  // 変数の宣言

  // アナログ入力値を取得
  ain[0] = analogRead(1);//right
  ain[1] = analogRead(2);//bottom
  ain[2] = analogRead(3);//left

  // 荷重をシリアル通信で送る
  if (ain[0] < 1000) {
    Serial.print(ain[0]);
    Serial.print(",");
    Serial.print(ain[1]);
    Serial.print(",");
    Serial.print(ain[2]);
    Serial.print("\n");

  }




  // 1秒待機
  delay(1000);
}
