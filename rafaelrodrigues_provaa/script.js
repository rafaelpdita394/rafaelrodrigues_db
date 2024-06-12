document.getElementById('loginButton').addEventListener('click', function() {
    document.getElementById('loginModal').style.display = 'block';
});

document.getElementById('cancelButton').addEventListener('click', function() {
    document.getElementById('loginModal').style.display = 'none';
});

document.getElementById('enterButton').addEventListener('click', function() {
    const telefone = document.getElementById('telefone').value;
    const senha = document.getElementById('senha').value;

    const xhr = new XMLHttpRequest();
    xhr.open("POST", "login.php", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            if (xhr.responseText == "success") {
                alert("Login realizado com sucesso!");
                // Aqui você pode permitir curtir e comentar nas fotos
                document.getElementById('loginModal').style.display = 'none';
                sessionStorage.setItem('loggedIn', 'true');
            } else {
                alert("Telefone ou senha incorretos.");
            }
        }
    };
    xhr.send("telefone=" + telefone + "&senha=" + senha);
});

document.querySelectorAll('.photo').forEach(photo => {
    photo.addEventListener('click', function() {
        if (sessionStorage.getItem('loggedIn') !== 'true') {
            document.getElementById('loginModal').style.display = 'block';
            return;
        }
        const modal = document.getElementById('photoModal');
        modal.style.display = 'block';
        document.getElementById('modalPhoto').src = this.src;

        document.getElementById('likeButton').addEventListener('click', function() {
            this.classList.toggle('filled');
            let count = parseInt(document.getElementById('likeCount').innerText);
            document.getElementById('likeCount').innerText = this.classList.contains('filled') ? count + 1 : count - 1;
        });
        
        document.getElementById('submitComment').addEventListener('click', function() {
            let count = parseInt(document.getElementById('commentCount').innerText);
            document.getElementById('commentCount').innerText = count + 1;
        });
    });
});

document.getElementById('closePhotoModal').addEventListener('click', function() {
    document.getElementById('photoModal').style.display = 'none';
});
