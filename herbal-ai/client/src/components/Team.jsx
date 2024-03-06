import Image3 from '../assets/AakashImg.png';
import Image2 from '../assets/Diya.jpg';
import Image1 from '../assets/JatinImg.jpg';
import Image4 from '../assets/Puranjay.jpg';
import Card from './Card';
import './styles.css';

const Team = () => {
  return (
    <>
      <div className="team__header w-full flex justify-center items-center h-[100px] mt-28">
        <h1 className="team-title px-16 text-xl py-1 bg-white shadow-md rounded-full">
          <span>Team</span>
        </h1>
      </div>
      <div className="w-[100%]">
        <div className="mx-auto w-[80%] max-xl:w-[90%] max-lg:w-[90%] flex flex-row flex-wrap gap-10 my-6 justify-center items-center">
          <Card Image={Image1} name="Jatin" />
          <Card Image={Image3} name="Aakash" />
          <Card Image={Image2} name="Diya" />
          <Card Image={Image4} name="Puranjay" />
        </div>
      </div>
    </>
  );
};

export default Team;
