import './styles.css';

const Card = ({ name, Image }) => {
  return (
    <div className="flex flex-col items-center bg-white shadow-md rounded-lg overflow-hidden text-center">
      <div className="p-4">
        <img
          src={Image}
          className="w-full h-44 object-cover rounded-lg"
          alt="team member"
        />
        <p className="mt-2 text-lg font-semibold text-gray-900">{name}</p>
      </div>
    </div>
  );
};

export default Card;
