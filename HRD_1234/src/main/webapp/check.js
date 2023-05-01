function check() {
	if(document.frm.player_name.value.length == 0) {
		alert("선수이름을 입력헤주세요");
		frm.player_name.focus();
		return false;
	}
	
	if(document.frm.player_position.value.length == 0) {
		alert("포지션을 입력헤주세요");
		frm.player_position.focus();
		return false;
	}
	
	if(document.frm.player_date.value.length == 0) {
		alert("등록일을 입력헤주세요");
		frm.player_date.focus();
		return false;
	}
	
	if(document.frm.team_id.value.length == 0) {
		alert("소속팀을 입력헤주세요");
		frm.team_id.focus();
		return false;
	}
	
	alert("정상적임 ㅅㄱ");
	return true;
}