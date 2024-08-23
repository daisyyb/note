//체크박스 처리 모듈
//- 전체선택 - .check-all
//- 필수선택 - .check-required-all
//- 전체항목 - .check-item
//- 필수항목 - .check-required-item
$(function(){
    //전체선택
    $(".check-all").change(function(){
        var checked = $(this).prop("checked");//this.checked
        $(".check-item").prop("checked", checked);
        
        //change를 강제로 발생시켜서 연쇄적인 처리
        $(".check-item").trigger("change");
    });
    $(".check-required-all").change(function(){
        var checked = $(this).prop("checked");//this.checked
        $(".check-required-item").prop("checked", checked);

        //change를 강제로 발생시켜서 연쇄적인 처리
        $(".check-item").trigger("change");
    });
    $(".check-item").change(function(){
        var requiredCount = $(".check-required-item").length;
        var checkRequiredCount = $(".check-required-item:checked").length;
        var checkRequiredAll = requiredCount == checkRequiredCount;

        var allCount = $(".check-item").length;
        var checkAllCount = $(".check-item:checked").length;
        var checkAll = allCount == checkAllCount;

        $(".check-required-all").prop("checked", checkRequiredAll);
        $(".check-all").prop("checked", checkAll);
    });
});