import logo from './logo.svg';
import './App.css';
import { blue } from '@ant-design/colors';

function App() {
  return (
    <div className='App'>
      <div className='black-nav'>
        <h4 color='blue'>블로그</h4>
      </div>
    </div>
  )
}

console.log(blue); // ['#E6F4FF', '#BAE0FF', '#91CAFF', '#69B1FF', '#4096FF', '#1677FF', '#0958D9', '#003EB3', '#002C8C', '#001D66']
console.log(blue.primary); // '#1677FF'

export default App;
