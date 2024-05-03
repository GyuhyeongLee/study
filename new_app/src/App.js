import logo from './logo.svg';
import './App.css';
import { blue } from '@ant-design/colors';
import { useState } from 'react';

function App(){

  let [글제목] = useState(['남자 코트 추천','강남 우동 맛집','파이썬 독학']);
  let [날짜,c] = useState('2월 17일 발행');
  let [따봉, 따봉변경] = useState(0);
  let [버튼] = useState(0);
  return (
    <div className="App">
      <div className="black-nav">
        <div>개발 블로그</div>
      </div>
      <div className='list'>
        <h4>{글제목[0]}</h4>
        <p>{날짜}</p>
        <button onClick={()=>{}}>{버튼}</button>
        <hr/>
        <h4>{글제목[1]} <span onClick={ ()=>{ 따봉변경(따봉+1)}}>👍🏻</span> {따봉} </h4>
        <p>{날짜}</p>
        <hr/>
        <h4>{글제목[2]}</h4>
        <p>{날짜}</p>
        <hr/>
      </div>
    </div>
  )
}
export default App;
