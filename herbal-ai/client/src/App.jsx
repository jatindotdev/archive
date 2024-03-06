import { useState } from 'react';
import { Element, Link } from 'react-scroll';
import { Toaster } from 'sonner';
import About from './components/About';
import Footer from './components/Footer';
import FormComponent from './components/FormComponent';
import LoginModal from './components/LoginModal';
import Team from './components/Team';

export function App() {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const changeModalState = () => {
    setIsModalOpen(!isModalOpen);
  };
  return (
    <Element name="Home">
      <Toaster richColors closeButton expand />
      <LoginModal isOpen={isModalOpen} setIsOpen={setIsModalOpen} />

      <div>
        <header className="bg-[#F8F9FA] w-full h-20 sticky z-50 top-0 shadow-md">
          <nav className="flex justify-between items-center w-full mx-auto h-full px-10 py-2 max-md:px-4">
            <a href="/">
              <h1 className="font-semibold text-lg max-md:text-xs ">
                AI-Based Flora Recognition
              </h1>
            </a>
            <div className="flex gap-10 justify-center items-center">
              <div className="flex gap-4 max-md:gap-2">
                <Link
                  to="Home"
                  spy={true}
                  smooth={true}
                  offset={-100}
                  duration={500}
                >
                  <p className="font-medium max-md:text-xs px-4 py-1 rounded-xl shadow-md bg-[#fffff] text-[#000] hover:transition all 0.2s ease-in-out cursor-pointer hover:bg-lime-100 ">
                    Home
                  </p>
                </Link>
                <Link
                  to="About"
                  spy={true}
                  smooth={true}
                  offset={-70}
                  duration={500}
                >
                  <p className="font-medium max-md:text-xs px-4 py-1 rounded-xl shadow-md bg-[#fffff] text-[#000] hover:transition all 0.2s ease-in-out cursor-pointer hover:bg-lime-100">
                    About
                  </p>
                </Link>
                <Link
                  to="Team"
                  spy={true}
                  smooth={true}
                  offset={-70}
                  duration={500}
                >
                  <p className="font-medium max-md:text-xs px-4 py-1 rounded-xl shadow-md bg-[#fffff] text-[#000] hover:transition all 0.2s ease-in-out cursor-pointer hover:bg-lime-100">
                    Team
                  </p>
                </Link>
              </div>
            </div>
          </nav>
        </header>
        <Element name="Form">
          <FormComponent id="Form" />
        </Element>
        <Element name="About">
          <About id="About" />
        </Element>
        <Element name="Team">
          <Team id="Team" />
        </Element>
        <Footer />
      </div>
    </Element>
  );
}
