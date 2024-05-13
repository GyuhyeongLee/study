import React, { useState } from 'react';
import MyButton from './MyButton';
import './styles.css'; // CSS 파일 불러오기

function App() {
    const [clickCount, setClickCount] = useState(0);

    const handleClick = () => {
        setClickCount(clickCount + 1);
    };

    return (
        <div>
            <p>버튼을 클릭한 횟수: {clickCount}</p>
            <MyButton label="클릭하세요" onClick={handleClick} />
        </div>
    );
}

export default App;
