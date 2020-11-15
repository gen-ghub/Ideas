if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

    function createImageURL(e){
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
    }

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    }

    if (document.getElementById('user-image')) {
    document.getElementById('user-image').addEventListener('change', function(e){
      createImageURL();
      const file =  e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });
    }
    else {
    document.getElementById('idea-image').addEventListener('change', function(e){
      createImageURL();
      const file =  e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });
  }
  });
}





