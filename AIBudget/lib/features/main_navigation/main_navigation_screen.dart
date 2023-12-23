import 'package:AIBudget/features/main_navigation/%08add_expense_screen.dart';
import 'package:AIBudget/features/main_navigation/payment_report_screen.dart';
import 'package:AIBudget/features/main_navigation/widgets/bottom_sheet.dart';
import 'package:AIBudget/features/main_navigation/widgets/cardApproval.dart';
import 'package:AIBudget/features/main_navigation/widgets/img_popup_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:AIBudget/constants/gaps.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainNavitationScreenState();
}

const Color kbYellow = Colors.amber;
const Color kbBlack = Colors.black87;
Map<DateTime, List<dynamic>> events = {};

class _MainNavitationScreenState extends State<MainScreen>
    with TickerProviderStateMixin {
  final PageController _controller = PageController();
  double _currentIndex = 0;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  bool isLoading = false;

  Future<double> fetchTotalAmountForDate(DateTime date) async {
    final response = await http.post(Uri.parse(
        "https://5431508973.for-seoul.synctreengine.com/total_amounts?date=${date.toIso8601String()}"));

    if (response.statusCode == 200) {
      return double.parse(response.body);
    } else {
      print("API Response Code: ${response.statusCode}"); // API 응답 코드 출력
      print("API Response Body: ${response.body}"); // API 응답 본문 출력
      throw Exception('Failed to load total amount for date');
    }
  }

  void _fetchCardApprovals() async {
    setState(() {
      isLoading = true; // 로딩 시작
      events.clear(); // 여기에서 events 맵을 초기화합니다.
    });

    DateTime dateToFetch =
        DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day);

    try {
      List<CardApprovalData> approvals =
          await fetchCardApprovals(dateToFetch, dateToFetch);
      double totalAmountForDate = await fetchTotalAmountForDate(dateToFetch);

      print("Fetched Card Approvals: $approvals"); // API 응답 확인
      print("Fetched Total Amount: $totalAmountForDate"); // API 응답 확인

      if (events[dateToFetch] == null) {
        events[dateToFetch] = [];
      }
      events[dateToFetch]!.addAll(approvals); // 카드 승인 데이터 추가
      events[dateToFetch]!.add(totalAmountForDate); // 총 금액 추가
    } catch (error) {
      print("Error fetching data: $error"); // 에러 출력
    }

    setState(() {
      isLoading = false; // 로딩 완료
      print(events); // events 맵 상태 출력
    });
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
    _fetchCardApprovals();
  }

  void _onPlusPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddExpenseScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        _currentIndex = _controller.page!;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showStackDialog();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showStackDialog() {
    final dialogFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    void _dialogOnClosePressed() {
      dialogFadeController.reverse().then((value) {});
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StackDialog(
            controller: _controller, initialIndex: _currentIndex);
      },
    ).then((_) {
      dialogFadeController.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AI Budget",
          style: TextStyle(color: kbBlack),
        ),
        centerTitle: true,
        leading: Builder(
          // 여기에 Builder 위젯을 추가합니다.
          builder: (context) => IconButton(
            color: kbBlack,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const FaIcon(FontAwesomeIcons.bars),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
        actions: <Widget>[
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            color: kbBlack,
            onPressed: () {
              _showStackDialog(); // 스마일 아이콘을 눌렀을 때 StackDialog를 표시합니다.
            },
            icon: const FaIcon(
              FontAwesomeIcons.tags,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: kbBlack,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          const PaymentReportScreen()), // 결제 보고서 페이지로 이동
                );
              },
              icon: const FaIcon(
                FontAwesomeIcons.chartPie,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 80,
              child: DrawerHeader(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  'Menu Header',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Gaps.v20,
            ListTile(
              tileColor: Colors.white,
              title: const Text(
                'Menu Item 1',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Do something...
                Navigator.of(context).pop(); // Drawer를 닫습니다.
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text(
                'Menu Item 2',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Do something...
                Navigator.of(context).pop(); // Drawer를 닫습니다.
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text(
                'Menu Item 3',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Do something...
                Navigator.of(context).pop(); // Drawer를 닫습니다.
              },
            ),
            // 다른 메뉴 항목을 추가하려면 여기에 추가하세요.
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Gaps.v10,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TableCalendar(
                  eventLoader: (date) {
                    return events[date] ?? [];
                  },
                  calendarBuilders: CalendarBuilders(
                    todayBuilder: (context, date, events) {
                      return Center(
                        child: Container(
                          width: 30, // 원하는 원의 너비
                          height: 30, // 원하는 원의 높이
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueGrey.shade300,
                          ),
                          child: Center(child: Text(date.day.toString())),
                        ),
                      );
                    },
                    selectedBuilder: (context, date, events) {
                      return Center(
                        child: Container(
                          width: 30, // 원하는 원의 너비
                          height: 30, // 원하는 원의 높이
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Center(child: Text(date.day.toString())),
                        ),
                      );
                    },
                    singleMarkerBuilder: (context, date, event) {
                      if (event is double) {
                        return Text(
                          event.toString(), // 해당 날짜의 총금액
                          style: const TextStyle(fontSize: 10.0),
                        );
                      }
                      return const Text(''); // 기본적으로 아무것도 표시하지 않음
                    },
                  ),
                  calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    if (format == CalendarFormat.week) {
                      //! 2weeks나 Weeks인 상태로 화살표를 누르면 월도 바뀜
                      setState(() {
                        _calendarFormat = CalendarFormat.week;
                      });
                    } else {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onDaySelected: _onDaySelected,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  headerStyle: const HeaderStyle(
                    formatButtonTextStyle: TextStyle(
                      color: kbBlack,
                      fontSize: 14,
                    ),
                    leftChevronIcon: Icon(Icons.chevron_left, color: kbBlack),
                    rightChevronIcon: Icon(Icons.chevron_right, color: kbBlack),
                    formatButtonShowsNext: false,
                  ),
                  locale: "ko_KR",
                  rowHeight: 60,
                  focusedDay: _focusedDay,
                  firstDay: DateTime.utc(2010, 10, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                ),
              ),
            ],
          ),
          CustomBottomSheet(selectedDate: _selectedDay),
        ],
      ),
    );
  }
}
