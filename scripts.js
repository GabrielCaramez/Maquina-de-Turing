let prevButton = document.getElementById("prev");
let nextButton = document.getElementById("next");
let container = document.querySelector(".container");
let items = container.querySelectorAll(".list .item");
let indicator = document.querySelector('.indicators');
let dots = indicator.querySelectorAll('ul li');
let activeIndex = 0;
let lastPosition = items.length - 1;

function updateActiveItem() {
    
    items.forEach(item => item.classList.remove('active'));
    
    items[activeIndex].classList.add('active');
    
    dots.forEach(dot => dot.classList.remove('active'));
    dots[activeIndex].classList.add('active');
}

function handleNextButton() {
    activeIndex = (activeIndex + 1) > lastPosition ? 0 : activeIndex + 1;
    updateActiveItem();
}

function handlePrevButton() {
    activeIndex = (activeIndex - 1) < 0 ? lastPosition : activeIndex - 1;
    updateActiveItem();
}

function setSlider() {
    if (nextButton) {
        nextButton.addEventListener('click', handleNextButton);
    }
    if (prevButton) {
        prevButton.addEventListener('click', handlePrevButton);
    }
    updateActiveItem(); 
}


setSlider();
