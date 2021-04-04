export const initFaceRecognitionForm = ()=>{
  const form = document.querySelector('.form-face-recognition')
  const fileField = form.querySelector('.file-input')
  fileField.addEventListener('change', (event)=>{
    form.submit()
  })
}