from flask import Flask

# Flask 애플리케이션 인스턴스 생성
app = Flask(__name__)

# 루트 URL에 대한 뷰 함수 정의
@app.route('/')
def hello():
    return 'Hello, World!'

# 애플리케이션 실행
if __name__ == '__main__':
    app.run(debug=True)
