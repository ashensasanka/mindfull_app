import 'package:flutter/material.dart';
import 'package:mindful_momentum/models/tasks_model.dart';

import '../pages/from_home_page/timer_page.dart';
import 'firestor.dart';

class Task_Widget extends StatefulWidget {
  Tasks _tasks;
  Task_Widget(this._tasks, {super.key});

  @override
  State<Task_Widget> createState() => _Task_WidgetState();
}

class _Task_WidgetState extends State<Task_Widget> {
  @override
  Widget build(BuildContext context) {
    bool isDone = widget._tasks.isDon;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              // image
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TimerPage(
                        taskTime: widget._tasks.tasktime,
                        uuid: widget._tasks.id,
                      ),
                    ),
                  );
                },
                child: imageee(),
              ),
              SizedBox(width: 25),
              // title and subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget._tasks.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Checkbox(
                          activeColor: Color(0xff638889),
                          value: isDone,
                          onChanged: (value) {
                            setState(() {
                              isDone = !isDone;
                            });
                            Firestore_Datasource()
                                .isdone(widget._tasks.id, isDone);
                          },
                        )
                      ],
                    ),
                    Text(
                      widget._tasks.subtitle,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400),
                    ),
                    Spacer(),
                    edit_time()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget edit_time() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 127,
            height: 28,
            decoration: BoxDecoration(
              color: Color(0xffEBD9B4),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/icon_time1.jpg'),
                  SizedBox(width: 5),
                  Text(
                    widget._tasks.time,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => Edit_Screen(widget._tasks),
              // ));
            },
            child: Container(
              width: 90,
              height: 28,
              decoration: BoxDecoration(
                color: Color(0xfff9efdb),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/icon_edit2.png'),
                    SizedBox(width: 10),
                    Text(
                      'edit',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageee() {
    return Container(
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/${widget._tasks.image}.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
