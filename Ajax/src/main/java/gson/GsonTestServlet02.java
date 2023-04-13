package gson;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.Person;

@WebServlet("/gson/text02")
public class GsonTestServlet02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/gson/text02 [GET]");
		
		//Gson객체
		Gson gson = new Gson();
		//=============================================
		
		Person p1 = new Person();
		System.out.println("p1 객체 : " + p1 );

		System.out.println("=======================");
	
		// p1객체 => JSON텍스트 (마샬링)
		// phone = null은 JSON에서 표현하지 않는다
		// 왜? 어차피 JS로가면 없는 데이터가 
		// null 혹은 undefined라고 나오기 때문에
		// 텍스트 낭비가 된다
		String jsonText = gson.toJson(p1);
		System.out.println( "p1 JSON : " + jsonText );
		
		System.out.println("=======================");
		
		// JSON텍스트 => p2객체 (언마샬링)
		// 제네릭이 적용되면서 Person타입으로 인식하면서 저장
		Person p2 = gson.fromJson( jsonText, Person.class );
		System.out.println("p2 Object : " + p2 );
		
		System.out.println("=======================");
		
		// JSON텍스트 => p3객체 (언마샬링)
		// 텍스트를 Person타입으로 변환하기
		Person p3 = gson.fromJson( "{\"name\":\"Alice\",\"age\":20,\"addr\":\"Souel\"}", Person.class );
		System.out.println("p3 Object : " + p3 );
		
		System.out.println("=======================");

		List<Person> list = new ArrayList<>();
		
		list.add(new Person());
		list.add(new Person());
		list.add(new Person());
		
		System.out.println("list 출력 : " + gson.toJson(list));
		
		Map< String ,List<Person> > map = new HashMap<>();
		
		map.put("list", list);
		
		System.out.println("map 출력 : " + gson.toJson(map));
		
		System.out.println("=======================");
		
		// HashMap<String, Object>타입으로 DTO를 대체할 수 있다
		Map<String, Object> data1 = new HashMap();
		
		data1.put("name", "Bob");
		data1.put("age", 30);
		data1.put("addr", "Busan");
		data1.put("phone", "01012345678");
		
		System.out.println("Map타입 : " + data1);
		System.out.println("Map JSON타입 : " + gson.toJson(data1));
		
		System.out.println("=======================");
		
		Map<String, Object> data2 = new HashMap();

		data2.put("name", "Clare");
		data2.put("phone", "01098745632");
		
		System.out.println("Map타입 : " + data2);
		System.out.println("Map JSON타입 : " + gson.toJson(data2));

		System.out.println("=======================");
		List< Map<String, Object> > dataList = new ArrayList<>();
		dataList.add(data1);
		dataList.add(data2);
		
		System.out.println("List에 Map담아 출력 : " + dataList);

		
		Map<String, List< Map<String, Object> > > res = new HashMap();
		res.put("dataList", dataList);
		
		System.out.println("Map속에 List속에 Map : " + res);
		System.out.println("JSON객체 변환 : " + gson.toJson(res));

		System.out.println("=======================");

		// Map타입의 Key인 res의 
		// List타입의 dataList의 0번째 인덱스의
		// Map타입의 Key인 name을 호출
		Object result_obj = res.get("dataList").get(0).get("name");
		System.out.println(result_obj);
		
		System.out.println("=======================");

		System.out.println("ForEach문 출력");
		for ( Map<String, Object> m : res.get("dataList") ) {
			System.out.println(m);
		}
		
		System.out.println("=======================");
		
		
	}

}
