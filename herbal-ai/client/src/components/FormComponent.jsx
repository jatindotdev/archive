import { useCallback, useState } from 'react';
import { useDropzone } from 'react-dropzone';
import { toast } from 'sonner';
import { store } from '../utils/store';
import ResultsModal from './ResultsModal';

const FormComponent = () => {
  const [file, setFile] = useState(null);
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState({});

  const [isResultsModalOpen, setIsResultsModalOpen] = useState(false);
  const changeResultsModalState = () => {
    setIsResultsModalOpen(!isResultsModalOpen);
  };

  const handleSubmit = async e => {
    e.preventDefault();
    if (!file) {
      toast.error('Please upload an image');
      return;
    }

    setLoading(true);
    const toastId = toast.loading('Starting prediction...');

    try {
      const formData = new FormData();
      formData.append('file', file);

      const resp = await fetch('http://localhost:8000/classify', {
        method: 'POST',
        body: formData,
      });

      toast.loading('Predicting...', {
        id: toastId,
      });

      const data = await resp.json();

      if (data.status === 'error') {
        toast.error('Something went wrong', {
          id: toastId,
        });
        return;
      }

      setResult({
        result: data.result,
        accuracy: data.accuracy,
      });

      if (data.status === 'success') {
        toast.success('Predicted successfully', {
          id: toastId,
        });
        toast.success(
          <div>
            <p className="text-lg font-semibold">
              Predicted Flora: {data.result}
            </p>
            <p className="text-sm">Accuracy: {data.accuracy}%</p>
          </div>,
          {
            duration: 10000,
          }
        );
      }

      store.results = [
        ...store.results,
        {
          result: data.result,
          accuracy: data.accuracy,
        },
      ];
    } catch (error) {
      console.log(error);
      toast.error('Something went wrong');
    }

    setLoading(false);
  };

  const handleDrop = useCallback(acceptedFiles => {
    const file = acceptedFiles[0];
    setFile(file);
  }, []);

  const { getRootProps, getInputProps } = useDropzone({
    accept: {
      'image/png': ['.png'],
      'image/jpeg': ['.jpeg'],
      'image/jpg': ['.jpg'],
    },
    multiple: false,
    validator: file => {
      if (file.size > 100000000) {
        return {
          code: 'file-too-large',
          message: 'File is too large',
        };
      }
      return null;
    },
    onDrop: handleDrop,
    onDropRejected: e => {
      console.log(e);
      toast.error('File rejected');
    },
    onFileDialogCancel: () => {
      toast.error('File upload cancelled');
    },
    onDropAccepted: file => {
      toast.success(`${file[0].name} uploaded successfully`);
    },
  });

  return (
    <div className="min-h-screen p-6 bg-gray-100 flex items-center justify-center flex-col">
      <ResultsModal
        isOpen={isResultsModalOpen}
        setIsOpen={setIsResultsModalOpen}
      />
      <div className="container max-w-screen-lg mx-auto">
        <div>
          <div className="bg-white rounded shadow-lg p-4 px-4 md:p-8 mb-6">
            <div className="flex flex-col md:flex-row">
              <div className="flex-1">
                <form
                  className="flex-1 text-center mt-40"
                  onSubmit={handleSubmit}
                >
                  <div className="flex flex-col items-center justify-center">
                    <h1 className="text-lg font-semibold">
                      AI-Based Flora Recognition
                    </h1>
                    <h2 className="text-sm">
                      Upload an image of your plant to get a prediction.
                    </h2>

                    <button
                      className="bg-blue-500 hover:bg-blue-700 text-white py-2 px-4 rounded-md w-32 flex justify-center items-center mt-4"
                      type="submit"
                    >
                      {loading ? (
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          width="1.5em"
                          height="1.5em"
                          viewBox="0 0 24 24"
                        >
                          <title>Loading... Please wait.</title>
                          <g
                            fill="none"
                            stroke="currentColor"
                            strokeLinecap="round"
                            strokeWidth="2"
                          >
                            <path
                              strokeDasharray="60"
                              strokeDashoffset="60"
                              strokeOpacity=".3"
                              d="M12 3C16.9706 3 21 7.02944 21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3Z"
                            >
                              <animate
                                fill="freeze"
                                attributeName="stroke-dashoffset"
                                dur="1.3s"
                                values="60;0"
                              />
                            </path>
                            <path
                              strokeDasharray="15"
                              strokeDashoffset="15"
                              d="M12 3C16.9706 3 21 7.02944 21 12"
                            >
                              <animate
                                fill="freeze"
                                attributeName="stroke-dashoffset"
                                dur="0.3s"
                                values="15;0"
                              />
                              <animateTransform
                                attributeName="transform"
                                dur="1.5s"
                                repeatCount="indefinite"
                                type="rotate"
                                values="0 12 12;360 12 12"
                              />
                            </path>
                          </g>
                        </svg>
                      ) : (
                        'Submit'
                      )}
                    </button>
                  </div>
                </form>
              </div>

              <div
                className="aspect-square w-full max-md:mx-auto max-md:my-10 col-span-1 rounded-md text-white bg-zinc-900 flex justify-center items-center relative flex-1"
                {...getRootProps()}
              >
                {/* a cross button */}
                {file && (
                  <button
                    type="button"
                    className="absolute -top-2 -right-2 rounded-full w-6 h-6 flex justify-center items-center bg-gray-50 text-zinc-900 hover:bg-gray-200 transition-all 0.2s ease-in-out"
                    onClick={e => {
                      e.stopPropagation();
                      setFile(null);
                    }}
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      viewBox="0 0 15 15"
                    >
                      <title>
                        Remove image and upload another image for prediction
                      </title>
                      <path
                        fill="currentColor"
                        fillRule="evenodd"
                        d="M11.782 4.032a.575.575 0 1 0-.813-.814L7.5 6.687L4.032 3.218a.575.575 0 0 0-.814.814L6.687 7.5l-3.469 3.468a.575.575 0 0 0 .814.814L7.5 8.313l3.469 3.469a.575.575 0 0 0 .813-.814L8.313 7.5l3.469-3.468Z"
                        clipRule="evenodd"
                      />
                    </svg>
                  </button>
                )}
                <input {...getInputProps()} required type="file" />
                {file ? (
                  <img
                    src={URL.createObjectURL(file)}
                    alt="preview"
                    className="w-full h-full object-contain rounded-md"
                  />
                ) : (
                  <p className="text-center">
                    Select or drag and drop your image here. <br />
                  </p>
                )}
              </div>
            </div>
          </div>
        </div>
      </div>
      <p
        className="font-medium px-4 py-1 rounded-xl shadow-md bg-[#fffff] text-[#000] hover:transition all 0.2s ease-in-out cursor-pointer hover:bg-lime-100 mb-3 text-xl"
        onKeyUp={changeResultsModalState}
      >
        Results
      </p>
      {result && (
        <div className="w-full bg-[#EFFDF3] shadow-lg p-4 mb-6 max-w-screen-lg rounded-lg">
          <div>
            <p className="text-lg font-semibold">
              Predicted Flora: {result.result}
            </p>
            <p className="mb-1">Accuracy: {result.accuracy}%</p>
            {/* show yellow note if accuracy below 85 */}
            {parseFloat(result.accuracy) < 85 && (
              <p className="text-yellow-700">
                Note: Accuracy is below 85%. Results might be inaccurate. Please
                consult a professional for further diagnosis. <br />
                Retry with a better image.
              </p>
            )}
            <p className="mt-10 text-sm">
              <span className="mt-4">Results are </span>
              <span className="font-semibold">not</span>
              <span> a substitute for professional medical advice.</span>
            </p>
          </div>
        </div>
      )}
    </div>
  );
};

export default FormComponent;
