
    function animator(num)
  {

var h = '.head';
var f1 = '.face-1';
var f2 = '.face-2';

var f1Win = "#mouth-1b";

var b = '.body';
var la = '.left-arm';
var ra = '.right-arm';

var ll = '.left-leg';
var rl = '.right-leg';

var nl = '.noose-long';
var nf = '.noose-fat';

switch (num)
        {
        	
    case 22:
    $(h).css("display", "block")		
    $(f1Win).css("display", "block")		
	$(b).css("display", "block");
	$(ra).css("display", "block");
	$(la).css("display", "block");
    $(rl).css("display", "block");
    $(ll).css("display", "block");		

    $(f1).css("display", "block");
    $(rl).css("display", "block");	
    break
            
	case 0:
	break;
	
	case 1:
	$(h + ',' + f1).css("display", "block")		
	break;
	
	case 2:
	$(h + ',' + f1).css("display", "block")		
	$(b).css("display", "block");
	break;
	
	case 3:
	$(h + ',' + f1).css("display", "block")		
	$(b).css("display", "block");
	$(ra).css("display", "block");
	$(la).css("display", "block");
	break;
	
	case 4:
	$(h + ',' + f1).css("display", "block")		
	$(b).css("display", "block");
	$(ra).css("display", "block");
	$(la).css("display", "block");
    $(rl).css("display", "block");
    $(ll).css("display", "block");		
	break;
	
	default:
    $(h + ',' + f1).css("display", "block")		
	$(b).css("display", "block");
	$(ra).css("display", "block");
	$(la).css("display", "block");
    $(rl).css("display", "block");
    $(ll).css("display", "block");		

    $(f1).css("display", "none");
    $(rl  + ',' + nl  + ',' + nf  + ',' + f2).css("display", "block");	
	break;
	
    
  case "reset":
    $(nl  + ',' + nf  + ',' + f2 + ',' + h + ',' + f1 + ',' + b + ',' + la + ',' + ra + ',' + ll + ',' + rl).css("display", "none");
    break;
	
	
        }
    }

