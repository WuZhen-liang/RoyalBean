(function (){

            div_item =document.getElementsByTagName('fieldset');
            console.log(div_item)
            for(let i=0 ;i<5;i++){
                div_item[i].addEventListener('mouseover',mouseover,true)
                div_item[i].addEventListener('mouseout',mouseout,true)
                div_item[i].addEventListener('click',click,true)
                div_item[i].addEventListener('dblclick',dblclick,true)
            }

            let mouseIn=true;
            function mouseover(event){           
                if (mouseIn) {    
                let mouseSelect= event.currentTarget;
                mouseSelect.querySelector('img').className = "color";
                score(event);
                }
            }
            function mouseout(event){    
                if(mouseIn){
                    let mouseOut= event.currentTarget;
                    mouseOut.querySelector('img').className = "nocolor"
                    document.getElementById("score").innerHTML=""
                }          
            }
            function click(event){
                mouseIn = false 
                score(event)

            }
            function dblclick(event){             
                mouseIn=true
                allremove(); 

            }
            function score(event){
                scoreFromStar=(event.currentTarget.id).charAt(3)
                if (mouseIn) {
                    document.getElementById("score").innerHTML=`評分為...${scoreFromStar}`
                }else{
                    document.getElementById("score").innerHTML=`獲得${scoreFromStar}顆星`
                }
            }
            function allremove(){
                let a = document.querySelectorAll('img')
                for(let j=0;j<5;j++){
                    a[j].className='nocolor';
                }
                document.getElementById("score").innerHTML=""
            }

        });