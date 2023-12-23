import 'package:AIBudget/constants/gaps.dart';
import 'package:AIBudget/features/main_navigation/%08add_expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:AIBudget/features/main_navigation/widgets/cardApproval.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // utf8을 사용하기 위해 필요합니다.

class CustomBottomSheet extends StatefulWidget {
  final DateTime selectedDate;

  const CustomBottomSheet({super.key, required this.selectedDate});

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  double? sheetHeight;
  bool sheetExpanded = false;
  List<CardApprovalData>? cardApprovals; // 카드 승인 데이터를 저장할 변수
  bool isLoading = false; // 로딩 상태를 저장할 변수
  DateTime? _previousSelectedDate;

  void _onPlusPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddExpenseScreen(),
      ),
    );
  }

  Future<double> fetchTotalAmount() async {
    //! 총금액 불러오기
    final response = await http.get(Uri.parse(
        "https://5431508973.for-seoul.synctreengine.com/total_amounts"));

    if (response.statusCode == 200) {
      // 만약 API 응답이 직접 금액이라면:
      return double.parse(utf8.decode(response.bodyBytes));

      // 만약 API 응답이 JSON 형태라면:
      // var data = json.decode(response.body);
      // return double.parse(data['totalAmount']); // 'totalAmount'는 실제 JSON 키에 따라 변경될 수 있습니다.
    } else {
      throw Exception('Failed to load total amount');
    }
  }

  void _fetchCardApprovals() async {
    setState(() {
      isLoading = true; // 로딩 시작
    });

    try {
      cardApprovals =
          await fetchCardApprovals(widget.selectedDate, widget.selectedDate);
    } catch (error) {
      // 에러 처리 (예: 에러 메시지 표시)
    }

    setState(() {
      isLoading = false; // 로딩 완료
    });
  }

  @override
  void initState() {
    super.initState();
    _previousSelectedDate = widget.selectedDate; // 초기 날짜 저장
    _fetchCardApprovals(); // 초기 데이터 로드
  }

  @override
  void didUpdateWidget(CustomBottomSheet oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 선택된 날짜가 변경되었을 때만, 데이터가 로딩 중이 아닐 때만,
    // 그리고 cardApprovals가 null일 때만 API를 호출합니다.
    if (_previousSelectedDate != widget.selectedDate && !isLoading) {
      _previousSelectedDate = widget.selectedDate;
      _fetchCardApprovals();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    sheetHeight = MediaQuery.of(context).size.height * 0.2;
  }

  void _toggleSheetExpansion() {
    // Add this method
    setState(() {
      if (sheetExpanded) {
        sheetHeight = MediaQuery.of(context).size.height * 0.2;
      } else {
        sheetHeight = MediaQuery.of(context).size.height * 0.45;
      }
      sheetExpanded = !sheetExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: GestureDetector(
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              duration: const Duration(milliseconds: 300),
              height: sheetHeight,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                children: [
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(sheetExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up),
                    onPressed: _toggleSheetExpansion,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "총 결제 금액: 1,000,000원",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Gaps.v20,
                  Expanded(
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : (cardApprovals != null
                            ? Stack(
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ...cardApprovals!.map(
                                          (e) => CardApproval(approvalData: e),
                                        ),
                                        Gaps.v60,
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      right: 20,
                                      bottom: 50,
                                      child: sheetExpanded
                                          ? FloatingActionButton(
                                              onPressed: _onPlusPressed,
                                              backgroundColor: Colors.black87,
                                              child: const FaIcon(
                                                FontAwesomeIcons.plus,
                                                size: 20,
                                              ),
                                            )
                                          : Container()),
                                ],
                              )
                            : const Center(child: Text("No data available"))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
