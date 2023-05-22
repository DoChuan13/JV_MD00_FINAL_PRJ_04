<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Firebase Image Upload using HTML and JavaScript</title>
</head>
<body>
<%--<progress value="0" max="100" id="uploader">0%</progress>--%>
<label for="avatar"></label>
<input name="avatar" type="text" id="avatar" style="display: none"/>
<br/>
<div id="imgDiv"></div>
<input type="file" multiple value="upload" accept=".jpg,.jpeg,.png" id="fileButton"/>
</body>

<script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-storage.js"></script>
<script>
    //paste here your copied configuration code
    const firebaseConfig = {
        apiKey: "AIzaSyDmLIWoffmOIMjYbW4iLAaJ3Zfxc3qHbgY",
        authDomain: "java-full-stack-76e1c.firebaseapp.com",
        projectId: "java-full-stack-76e1c",
        storageBucket: "java-full-stack-76e1c.appspot.com",
        messagingSenderId: "831786675648",
        appId: "1:831786675648:web:5725a3c4d47951a8aa2c25",
        measurementId: "G-DZ0HGPMKSK"
    };
    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
    console.log(firebase);
    const fileButton = document.getElementById("fileButton");
    const uploader = document.getElementById('uploader');
    let fileUrl = "";

    let fileArr = [];

    function uploadImage() {
        const ref = firebase.storage().ref();
        for (let i = 0; i < fileButton.files.length; i++) {
            const file = fileButton.files[i];
            const name = +new Date() + "-" + file.name;
            const metadata = {
                contentType: file.type
            };
            const task = ref.child(name).put(file, metadata);


            task.then(snapshot => snapshot.ref.getDownloadURL()).then(url => {
                // console.log(url);

                // alert('image uploaded successfully');
                let divLocation = document.getElementById("imgDiv");
                let imgElement = document.createElement("img");
                fileUrl = url;
                fileArr.push(url);

                imgElement.src = url;
                imgElement.width = 100;
                imgElement.height = 100;
                divLocation.append(imgElement);
                resultImage();
                document.getElementById("avatar").value = fileArr.toString();
            })
                .catch(console.error);
        }
    }

    function resultImage() {
        console.log(fileArr);
        console.log('image result -->', fileUrl);
        return fileUrl;
    }

    fileButton.addEventListener('change', uploadImage);
</script>
</html>
