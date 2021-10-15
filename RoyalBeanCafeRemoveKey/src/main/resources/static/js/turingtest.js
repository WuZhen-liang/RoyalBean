$(function(){

    var saveBox;
    var codeLen=4;
//          startCode
    if($("#turingtest").val().length < codeLen){
        var code =createCode();
        $("#turingtest").text(code);
        saveBox = code;
    }

    $('#reload').click(function(){
        saveBox="";
        var code =createCode();
        $("#turingtest").text(code);
        saveBox = code;
    })

    $('#send').click(function(){
        var text=$('#textBox').val();
        if(text==saveBox){
            $('#result').text('驗證成功');
        }
        else{
            $('#result').text('驗證失敗');
        }
    })

    function createCode(){
        var code="";
        var codebox = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E'
                                ,'F','G','H','J','K','L','M','N','P','Q',
                                'R','S','T','U','V','W','X','Y','Z','a','b'
                                ,'c','d','e','f','g','h','i','j','k','m'
                                ,'n','o','p','q','r','s','t','u','v','w','x'
                                ,'y','z');
        for(var i = 0;i<codeLen;i++){
            var ramdomNumber= Math.floor(Math.random()*59);
            code +=codebox[ramdomNumber];
        }
        return code;
    }
                   
});